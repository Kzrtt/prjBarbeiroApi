import { barbeiroController } from '../controllers/barbeiroController'

export default function barbeiroRoutes(app) {
    app.post('/barbeiro/inserir', barbeiroController.insertBarber)
    app.get('/barbeiro/list/:id', barbeiroController.listBarbers)
}
