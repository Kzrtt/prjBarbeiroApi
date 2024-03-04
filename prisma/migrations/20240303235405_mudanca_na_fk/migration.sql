-- DropIndex
DROP INDEX `DiasTrabalho_idBarbeiro_key` ON `diastrabalho`;

-- CreateIndex
CREATE INDEX `Barbeiro_idBarbeiro_fkey` ON `diastrabalho`(`idBarbeiro`);
