import { scheduleController } from "../controllers/scheduleController";

export default function scheduleRoutes(app) {
    app.post('/schedule/insert', scheduleController.insertSchedule)
}