import { productController } from '../controllers/productController'

export default function productRoutes(app) {
    app.post('/product/insert', productController.insertProduct)
    app.get('/product/list/:id', productController.listProducts)
    app.post('/product/update/:id', productController.updateProduct)
}