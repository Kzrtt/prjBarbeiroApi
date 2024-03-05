import { Elysia } from 'elysia';
import personRoutes from './src/routes/personRoutes';
import barberRoutes from './src/routes/barberRoutes';
import establishmentRoutes from './src/routes/establishmentRoutes';
import productRoutes from './src/routes/productRoutes';
import serviceRoutes from './src/routes/serviceRoutes';
import scheduleRoutes from './src/routes/scheduleRoutes';

const app = new Elysia();

// Use as rotas de pessoa
personRoutes(app)
barberRoutes(app)
establishmentRoutes(app)
productRoutes(app)
serviceRoutes(app)
scheduleRoutes(app)

export { app };