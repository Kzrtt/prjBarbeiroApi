/*
  Warnings:

  - You are about to drop the column `day` on the `agendamento` table. All the data in the column will be lost.
  - Added the required column `dia` to the `agendamento` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `agendamento` DROP COLUMN `day`,
    ADD COLUMN `dia` DATETIME(3) NOT NULL;
