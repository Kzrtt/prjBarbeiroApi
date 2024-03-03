import { estabelecimentoController } from '../controllers/estabelecimentoController'

export default function estabelecimentoRoutes(app) {
    app.post('/estabelecimento/inserir', estabelecimentoController.insertEstablishment)
}
