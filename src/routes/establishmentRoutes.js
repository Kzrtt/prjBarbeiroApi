import { establishmentController } from '../controllers/establishmentController'

export default function establishmentRoutes(app) {
    app.post('/estabelecimento/inserir', establishmentController.insertEstablishment)
}
