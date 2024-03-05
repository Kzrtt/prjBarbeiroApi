/*
  Warnings:

  - You are about to drop the column `dia` on the `agendamento` table. All the data in the column will be lost.
  - You are about to alter the column `status` on the `agendamento` table. The data in that column could be lost. The data in that column will be cast from `TinyInt` to `VarChar(191)`.

*/
-- AlterTable
ALTER TABLE `agendamento` DROP COLUMN `dia`,
    MODIFY `status` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `agendamentoproduto` ADD CONSTRAINT `agendamentoproduto_idProduto_fkey` FOREIGN KEY (`idProduto`) REFERENCES `produto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agendamentoproduto` ADD CONSTRAINT `agendamentoproduto_idAgendamento_fkey` FOREIGN KEY (`idAgendamento`) REFERENCES `agendamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agendamentoservico` ADD CONSTRAINT `agendamentoservico_idServico_fkey` FOREIGN KEY (`idServico`) REFERENCES `servico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `agendamentoservico` ADD CONSTRAINT `agendamentoservico_idAgendamento_fkey` FOREIGN KEY (`idAgendamento`) REFERENCES `agendamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
