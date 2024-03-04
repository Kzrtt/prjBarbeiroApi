import { PrismaClient } from "@prisma/client"
import { validations } from "../utils/validationMethods"
import { functions } from "../utils/crypt"

const prisma = new PrismaClient()

function validate(criptedToken) {
    const token = functions.decriptText(criptedToken)
    const [email, pass] = token.split(', ')

    console.log(email + " " + pass)

    const result = prisma.pessoa.findMany({
        where: {
            email: email,
            senha: pass,
        }
    })

    return result.lenght !== 0
}

export const personController = {
    //? Fazer método para listar agendamentos primeiro, para depois verificar se não existe um 
    //? agendamento aberto antes de tentar deletar a pessoas
    async deleteAccount({ body }) {

    },

    async updateAcount({ body }) {
        let response = {
            "status": false,
            "data": {},
            "message": "Erro ao atualizar usuário"
        }

        const hasEmail = await prisma.pessoa.findMany({
            where: {
                email: body['user']['email'],
                id: {
                    not: parseInt(body['user']['id'])
                }
            }
        })

        if(hasEmail.length !== 0) {
            response['message'] = 'Email ja cadastrado...'
            return response
        } 

        const updatedUser = await prisma.pessoa.update({
            where: {
                id: parseInt(body['user']['id'])
            },
            data: {
                nome: body['user']['name'],
                telefone: body['user']['phone'],
                email: body['user']['email'],
            }
        })

        if(updatedUser) {
            response['status'] = true
            response['data']['person'] = updatedUser
            response['message'] = 'Usuário atualizado com sucesso!!'
        }

        return response
    },

    async login({ body }) {
        const email = body['email']
        const pass = body['password']
        let response = {
            "status": false,
            "data": {},
            "message": ""
        }

        const result = await prisma.pessoa.findMany({
            where: {
                email: email
            },
        })

        const user = result[0]
        console.log(user)

        if(!user) {
            response['message'] = "Usuário não encontrado"
            return response
        }

        if(user['senha'] == pass) {
            let token = functions.criptText(`${user['nome']}, ${user['email']}`)

            response['status'] = true
            response['data']['token'] = token
            response['message'] = "Login efetuado com sucesso"
        }

        return response
    },

    async insertPerson({ body }) {
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
            const result = await prisma.pessoa.create({
                data: {
                    nome: body['name'],
                    cpf: body['cpf'],
                    telefone: body['phone'],
                    email: body['email'],
                    senha: body['password'],
                    isBarber: false,
                }
            })
            response['status'] = true,
            response['data']['person'] = result
            response['message'] = "Usuário cadastrado com sucesso"
        } catch (error) {
            response['error'] = error
        }

        return response
    }
}