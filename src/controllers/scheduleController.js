import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

let response = {
    "status": false,
    "data": {},
    "message": ""
}

export const scheduleController = {
    async insertSchedule({ body }) {
        const schedule = await prisma.agendamento.create({
            data: {
                horario: body['hour'],
                dia: body['day'],
                idEstabelecimento: body['establishmentId'],
                idPessoa: body['personId'],
                idBarbeiro: body['barberId'],
                status: "Agendado",
            }
        })

        if(!schedule) {
            response['message'] = "Erro ao agendar horário"
            return response
        }

        let servicesArray = []
        for (const element of body['services']) {
            const scheduleService = await prisma.agendamentoservico.create({
                data: {
                    idServico: parseInt(element),
                    idAgendamento: parseInt(schedule['id'])
                },
                include: {
                    Servico: true
                }
            })

            if(!scheduleService) {
                response['message'] = "Erro ao adicionar serviços ao agendamento"
                return response
            }

            servicesArray.push(scheduleService)
        }

        let productsArray = []
        for (const element of body['products']) {
            const scheduleProduct = await prisma.agendamentoproduto.create({
                data: {
                    idProduto: parseInt(element['id']),
                    idAgendamento: parseInt(schedule['id']),
                    quantidade: element['qntd']
                },
                include: {
                    Produto: true
                }
            })

            if(!scheduleProduct) {
                response['message'] = "Erro ao adicionar produtos ao agendamento"
                return response
            }
            
            productsArray.push(scheduleProduct)
        }

        response['status'] = true
        response['data'] = {
            "agendamento": schedule,
            "services": servicesArray,
            "products": productsArray,
        }
        response['message'] = "Agendamento marcado com sucesso"

        return response
    }
}