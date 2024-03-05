import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

let response = {
    "status": false,
    "data": {},
    "message": ""
}

export const serviceController = {
    async updateServices({ body }) {
        const service = await prisma.servico.update({
            where: {
                id: parseInt(id)
            },
            data: {
                name: body['name'],
                detalhes: body['details'],
                preco: body['price'],
                duracao: body['duration'],
            }
        })

        if(!service) {
            response['message'] = 'Erro ao atualizar dados do serviço'
            return response
        }

        response['status'] = true,
        response['data'] = service,
        response['message'] = "Produto atualizado com sucesso"

        return response
    },

    async listServices({ params: { id } }) {
       const services = await prisma.servico.findMany({
            where: {
                idEstabelecimento: parseInt(id)
            }
       })

       if(services.length === 0) {
            response['message'] = "Erro ao Listar serviços"
            return response
       }

       response['status'] = true,
       response['data'] = services,
       response['message'] = "Serviços listados com sucesso"
       
       return response
    },

    async insertService({ body }) {
        const service = await prisma.servico.create({
            data: {
                nome: body['name'],
                detalhes: body['details'],
                preco: body['price'],
                duracao: body['duration'],
                idEstabelecimento: body['establishmentId']
            }
        })

        if(!service) {
            response['message'] = "Erro ao inserir serviço"
            return response
        }

        response['status'] = true,
        response['data'] = service,
        response['message'] = 'Serviço inserido com sucesso'
        return response
    }
}