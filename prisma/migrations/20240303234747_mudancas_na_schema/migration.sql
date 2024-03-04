-- DropForeignKey
ALTER TABLE `agendamento` DROP FOREIGN KEY `Agendamento_idBarbeiro_fkey`;

-- DropForeignKey
ALTER TABLE `agendamento` DROP FOREIGN KEY `Agendamento_idEstabelecimento_fkey`;

-- DropForeignKey
ALTER TABLE `agendamento` DROP FOREIGN KEY `Agendamento_idPessoa_fkey`;

-- DropForeignKey
ALTER TABLE `agendamentoproduto` DROP FOREIGN KEY `AgendamentoProduto_idAgendamento_fkey`;

-- DropForeignKey
ALTER TABLE `agendamentoproduto` DROP FOREIGN KEY `AgendamentoProduto_idProduto_fkey`;

-- DropForeignKey
ALTER TABLE `agendamentoservico` DROP FOREIGN KEY `AgendamentoServico_idAgendamento_fkey`;

-- DropForeignKey
ALTER TABLE `agendamentoservico` DROP FOREIGN KEY `AgendamentoServico_idServico_fkey`;

-- DropForeignKey
ALTER TABLE `barbeiro` DROP FOREIGN KEY `Barbeiro_idEstabelecimento_fkey`;

-- DropForeignKey
ALTER TABLE `barbeiro` DROP FOREIGN KEY `Barbeiro_idPessoa_fkey`;

-- DropForeignKey
ALTER TABLE `diastrabalho` DROP FOREIGN KEY `DiasTrabalho_idBarbeiro_fkey`;

-- DropForeignKey
ALTER TABLE `produto` DROP FOREIGN KEY `Produto_idEstabelecimento_fkey`;

-- DropForeignKey
ALTER TABLE `servico` DROP FOREIGN KEY `Servico_idEstabelecimento_fkey`;
