import { personController } from '../controllers/personController'

export default function pessoaRoutes(app) {
    app.post('/pessoa/inserir', personController.insertPerson)
    app.post('/pessoa/login', personController.login)
    app.post('/pessoa/update', personController.updateAcount)
}
