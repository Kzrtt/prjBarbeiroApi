import { PrismaClient } from "@prisma/client"
import { validations } from "../utils/validationMethods"

const prisma = new PrismaClient()

export const barbeiroController = {
    async listBarbers({ params: { id } }) {
        let response = {
            "status": false,
            "data": {},
            "message": "",
        }

        const barbersList = await prisma.barbeiro.findMany({
            where: {
                idEstabelecimento: parseInt(id)
            }
        })

        if(barbersList.length === 0) {
            response['message'] = "Nenhum barbeiro encontrado..."
            return response
        }

        let barbersArray = []
        for (let index = 0; index < barbersList.length; index++) {
            barbersArray.push(barbersList[index]) 
        }

        response['data']['barbers'] = barbersArray
        response['status'] = true
        response['message'] = "Barbeiros listados com sucesso!!"

        return response
    },

    async insertBarber({ body }) {
        let response = {
            "status": false,
            "data": {},
            "message": "",
        }

        if(!validations.validaCPF(body['cpf'])) {
            response['message'] = "cpf inválido"
            return response
        }

        if(!validations.validaEmail(body['email'])) {
            response['message'] = "email inválido"
            return response
        }

        try {
            const barber = await prisma.barbeiro.create({
                data: {
                    nome: body['name'],
                    cpf: body['cpf'],
                    telefone: body['phone'],
                    email: body['email'],
                    senha: body['password'],
                    idEstabelecimento: body['idEstabelecimento'], 
                    diasTrabalho: body['days'],
                    horarios: body['hours']
                }
            });
            response['status'] = true
            response['data']['barber'] = barber
            response['message'] = 'Barbeiro inserido com sucesso!!'
        } catch (error) {
            response['error'] = error
        }

        return response
    }
}