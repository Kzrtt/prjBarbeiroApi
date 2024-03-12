import { barberController } from '../controllers/barberController'

export default function barberRoutes(app) {
    app.post('/barbeiro/inserir', barberController.insertBarber)
    app.get('/barbeiro/list/:id', barberController.listBarbers)
    app.post('/barbeiro/listHours', barberController.listPossibleHours)
}
