import { serviceController } from "../controllers/serviceController";

export default function serviceRoutes(app) {
    app.post('/service/insert', serviceController.insertService)
    app.get('/service/list/:id', serviceController.listServices)
}