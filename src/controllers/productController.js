import { Prisma, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export const productController = {
    async updateProduct({ body, params: { id } }) {
        let response = {
            "status": false,
            "data": {},
            "message": ""
        }

        const product = await prisma.produto.update({
            where: {
                id: parseInt(id),
            },
            data: {
                nome: body['name'],
                detalhes: body['details'],
                preco: body['price'],
                foto: body['image']
            }
        })

        if(!product) {
            response['message'] = 'erro ao alterar produto'
            return response
        }

        response['status'] = true,
        response['data'] = product,
        response['message'] = "Produto alterado com sucesso"
        return response
    },

    async listProducts({ params: {id} }) {
        let response = {
            "status": false,
            "data": {},
            "message": ""
        }

        const products = await prisma.produto.findMany({
            where: {
                idEstabelecimento: parseInt(id)
            }
        })

        if(products.length === 0) {
            response['message'] = "Erro ao listar os produtos"
            return response
        }

        response['status'] = true,
        response['data'] = products,
        response['message'] = 'Produtos listados com sucesso'

        return response
    },

    async insertProduct({ body }) {
        let response = {
            "status": false,
            "data": {},
            "message": ""
        }

        const product = await prisma.produto.create({
            data: {
                nome: body['name'],
                detalhes: body['details'],
                preco: body['price'],
                foto: body['image'],
                idEstabelecimento: body['establishmentId']
            }
        })

        if(!product) {
            response['message'] = "erro ao criar produto"
            return response
        }

        response['status'] = true
        response['data'] = product
        response['message'] = 'Produto inserido com sucesso'

        return response
    }
}