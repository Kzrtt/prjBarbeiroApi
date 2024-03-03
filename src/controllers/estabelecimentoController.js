import { PrismaClient } from "@prisma/client"
import { validations } from "../utils/validationMethods"

const prisma = new PrismaClient()

export const estabelecimentoController = {
    async insertEstablishment({ body }) {
        let response = {
            "status": false,
            "data": {},
            "message": "",
        }

        if(!validations.validaCNPJ(body['cnpj'])) {
            response['message'] = "cnpj inválido"
            return response
        }

        try {
            const result = await prisma.estabelecimento.create({
                data: {
                    nome: body['name'],
                    cnpj: body['cnpj'],
                    email: body['email'],
                }
            })
            response['status'] = true,
            response['data']['estabelecimento'] = result
            response['message'] = "Estabelecimento cadastrado com sucesso"
        } catch (error) {
            response['error'] = error
        }

        return response
    }
}