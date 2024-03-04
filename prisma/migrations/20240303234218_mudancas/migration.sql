/*
  Warnings:

  - Added the required column `quantidade` to the `AgendamentoProduto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `agendamentoproduto` ADD COLUMN `quantidade` INTEGER NOT NULL;
