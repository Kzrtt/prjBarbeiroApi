import { Elysia } from 'elysia';
import personRoutes from './src/routes/personRoutes';
import barberRoutes from './src/routes/barberRoutes';
import establishmentRoutes from './src/routes/establishmentRoutes';

const app = new Elysia();

// Use as rotas de pessoa
personRoutes(app)
barberRoutes(app)
establishmentRoutes(app)

export { app };