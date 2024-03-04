/*
  Warnings:

  - You are about to drop the column `cpf` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `diasTrabalho` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `horarios` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `senha` on the `barbeiro` table. All the data in the column will be lost.
  - You are about to drop the column `telefone` on the `barbeiro` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[idPessoa]` on the table `Barbeiro` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `Pessoa` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `status` to the `Agendamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horaFim` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horaInicio` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPessoa` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bairro` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cidade` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `complemento` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rua` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefone` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uf` to the `Estabelecimento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isBarber` to the `Pessoa` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Barbeiro_cpf_key` ON `barbeiro`;

-- AlterTable
ALTER TABLE `agendamento` ADD COLUMN `status` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `barbeiro` DROP COLUMN `cpf`,
    DROP COLUMN `diasTrabalho`,
    DROP COLUMN `email`,
    DROP COLUMN `horarios`,
    DROP COLUMN `nome`,
    DROP COLUMN `senha`,
    DROP COLUMN `telefone`,
    ADD COLUMN `horaFim` VARCHAR(191) NOT NULL,
    ADD COLUMN `horaInicio` VARCHAR(191) NOT NULL,
    ADD COLUMN `idPessoa` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `estabelecimento` ADD COLUMN `bairro` VARCHAR(191) NOT NULL,
    ADD COLUMN `cidade` VARCHAR(191) NOT NULL,
    ADD COLUMN `complemento` VARCHAR(191) NOT NULL,
    ADD COLUMN `numero` VARCHAR(191) NOT NULL,
    ADD COLUMN `rua` VARCHAR(191) NOT NULL,
    ADD COLUMN `telefone` VARCHAR(191) NOT NULL,
    ADD COLUMN `uf` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `pessoa` ADD COLUMN `isBarber` BOOLEAN NOT NULL;

-- CreateTable
CREATE TABLE `DiasTrabalho` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idBarbeiro` INTEGER NOT NULL,
    `diaSemana` INTEGER NOT NULL,

    UNIQUE INDEX `DiasTrabalho_idBarbeiro_key`(`idBarbeiro`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Barbeiro_idPessoa_key` ON `Barbeiro`(`idPessoa`);

-- CreateIndex
CREATE UNIQUE INDEX `Pessoa_email_key` ON `Pessoa`(`email`);

-- AddForeignKey
ALTER TABLE `Barbeiro` ADD CONSTRAINT `Barbeiro_idPessoa_fkey` FOREIGN KEY (`idPessoa`) REFERENCES `Pessoa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DiasTrabalho` ADD CONSTRAINT `DiasTrabalho_idBarbeiro_fkey` FOREIGN KEY (`idBarbeiro`) REFERENCES `Barbeiro`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
