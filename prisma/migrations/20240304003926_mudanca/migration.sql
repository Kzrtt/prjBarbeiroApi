-- AddForeignKey
ALTER TABLE `diastrabalho` ADD CONSTRAINT `diastrabalho_idBarbeiro_fkey` FOREIGN KEY (`idBarbeiro`) REFERENCES `barbeiro`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
