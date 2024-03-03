-- CreateTable
CREATE TABLE `Pessoa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Pessoa_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Barbeiro` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idPessoa` INTEGER NOT NULL,
    `idEstabelecimento` INTEGER NOT NULL,
    `diasTrabalho` VARCHAR(191) NOT NULL,
    `horarios` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Barbeiro_idPessoa_key`(`idPessoa`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estabelecimento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cnpj` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Estabelecimento_email_key`(`email`),
    UNIQUE INDEX `Estabelecimento_cnpj_key`(`cnpj`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Produto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `detalhes` VARCHAR(191) NOT NULL,
    `preco` DECIMAL(65, 30) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `idEstabelecimento` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `detalhes` VARCHAR(191) NOT NULL,
    `preco` DECIMAL(65, 30) NOT NULL,
    `duracao` DATETIME(3) NOT NULL,
    `idEstabelecimento` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Agendamento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dia` DATETIME(3) NOT NULL,
    `horario` DATETIME(3) NOT NULL,
    `idEstabelecimento` INTEGER NOT NULL,
    `idBarbeiro` INTEGER NOT NULL,
    `idPessoa` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AgendamentoProduto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idProduto` INTEGER NOT NULL,
    `idAgendamento` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AgendamentoServico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idServico` INTEGER NOT NULL,
    `idAgendamento` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Barbeiro` ADD CONSTRAINT `Barbeiro_idPessoa_fkey` FOREIGN KEY (`idPessoa`) REFERENCES `Pessoa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Barbeiro` ADD CONSTRAINT `Barbeiro_idEstabelecimento_fkey` FOREIGN KEY (`idEstabelecimento`) REFERENCES `Estabelecimento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Produto` ADD CONSTRAINT `Produto_idEstabelecimento_fkey` FOREIGN KEY (`idEstabelecimento`) REFERENCES `Estabelecimento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Servico` ADD CONSTRAINT `Servico_idEstabelecimento_fkey` FOREIGN KEY (`idEstabelecimento`) REFERENCES `Estabelecimento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agendamento` ADD CONSTRAINT `Agendamento_idEstabelecimento_fkey` FOREIGN KEY (`idEstabelecimento`) REFERENCES `Estabelecimento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agendamento` ADD CONSTRAINT `Agendamento_idBarbeiro_fkey` FOREIGN KEY (`idBarbeiro`) REFERENCES `Barbeiro`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agendamento` ADD CONSTRAINT `Agendamento_idPessoa_fkey` FOREIGN KEY (`idPessoa`) REFERENCES `Pessoa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgendamentoProduto` ADD CONSTRAINT `AgendamentoProduto_idProduto_fkey` FOREIGN KEY (`idProduto`) REFERENCES `Produto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgendamentoProduto` ADD CONSTRAINT `AgendamentoProduto_idAgendamento_fkey` FOREIGN KEY (`idAgendamento`) REFERENCES `Agendamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgendamentoServico` ADD CONSTRAINT `AgendamentoServico_idServico_fkey` FOREIGN KEY (`idServico`) REFERENCES `Servico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AgendamentoServico` ADD CONSTRAINT `AgendamentoServico_idAgendamento_fkey` FOREIGN KEY (`idAgendamento`) REFERENCES `Agendamento`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
