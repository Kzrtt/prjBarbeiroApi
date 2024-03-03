import { pessoaController } from '../controllers/pessoaController'

export default function pessoaRoutes(app) {
    app.post('/pessoa/inserir', pessoaController.insertPerson)
    app.post('/pessoa/login', pessoaController.login)
    app.post('/pessoa/update', pessoaController.updateAcount)
}
