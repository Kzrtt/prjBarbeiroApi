-- AddForeignKey
ALTER TABLE `barbeiro` ADD CONSTRAINT `barbeiro_idPessoa_fkey` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `barbeiro` RENAME INDEX `Barbeiro_idPessoa_key` TO `barbeiro_idPessoa_key`;
