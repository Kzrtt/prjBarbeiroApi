/*
  Warnings:

  - A unique constraint covering the columns `[cpf]` on the table `Barbeiro` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cpf` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `senha` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefone` to the `Barbeiro` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `barbeiro` DROP FOREIGN KEY `Barbeiro_idPessoa_fkey`;

-- AlterTable
ALTER TABLE `barbeiro` ADD COLUMN `cpf` VARCHAR(191) NOT NULL,
    ADD COLUMN `email` VARCHAR(191) NOT NULL,
    ADD COLUMN `nome` VARCHAR(191) NOT NULL,
    ADD COLUMN `senha` VARCHAR(191) NOT NULL,
    ADD COLUMN `telefone` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Barbeiro_cpf_key` ON `Barbeiro`(`cpf`);
