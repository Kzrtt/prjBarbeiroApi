/*
  Warnings:

  - You are about to drop the column `idPessoa` on the `barbeiro` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `Barbeiro_idPessoa_key` ON `barbeiro`;

-- AlterTable
ALTER TABLE `barbeiro` DROP COLUMN `idPessoa`;
