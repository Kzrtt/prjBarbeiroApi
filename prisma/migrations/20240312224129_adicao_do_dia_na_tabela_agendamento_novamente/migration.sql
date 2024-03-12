/*
  Warnings:

  - Added the required column `day` to the `agendamento` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `agendamento` ADD COLUMN `day` DATETIME(3) NOT NULL;

-- RenameIndex
ALTER TABLE `agendamentoproduto` RENAME INDEX `agendamentoproduto_idAgendamento_fkey` TO `AgendamentoProduto_idAgendamento_fkey`;

-- RenameIndex
ALTER TABLE `agendamentoproduto` RENAME INDEX `agendamentoproduto_idProduto_fkey` TO `AgendamentoProduto_idProduto_fkey`;

-- RenameIndex
ALTER TABLE `agendamentoservico` RENAME INDEX `agendamentoservico_idAgendamento_fkey` TO `AgendamentoServico_idAgendamento_fkey`;

-- RenameIndex
ALTER TABLE `agendamentoservico` RENAME INDEX `agendamentoservico_idServico_fkey` TO `AgendamentoServico_idServico_fkey`;
