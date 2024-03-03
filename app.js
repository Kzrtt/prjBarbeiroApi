import { Elysia } from 'elysia';
import pessoaRoutes from './src/routes/pessoaRoutes';
import barbeiroRoutes from './src/routes/barbeiroRoutes';
import estabelecimentoRoutes from './src/routes/estabelecimentoRoutes';

const app = new Elysia();

// Use as rotas de pessoa
pessoaRoutes(app)
barbeiroRoutes(app)
estabelecimentoRoutes(app)

export { app };