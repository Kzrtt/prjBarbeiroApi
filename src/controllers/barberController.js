import { PrismaClient } from "@prisma/client"
import { utilsMethods } from "../utils/utilsMethods"

const prisma = new PrismaClient()

export const barberController = {
    async listPossibleHours({ body }) {
        let response = {
            "status": false,
            "data": {},
            "message": ""
        }

        //? Buscar o dia, verificar se existem agendamentos
        const getDay = await prisma.agendamento.findMany({})

        //? caso existam remover os horários relativos ao agendamento
        //? pedir na requisição o serviço que será realizado para saber quais horários podem ser oferecidos para o cliente
        //? caso não tenha agendamento disponivel retornar horários com intervalo de tempo entre si com a duração dos serviços
        //? desejados
    },

    async listBarbers({ params: { id } }) {
        let response = {
            "status": false,
            "data": {},
            "message": "",
        }

        const barbersList = await prisma.barbeiro.findMany({
            where: {
                idEstabelecimento: parseInt(id)
            },
            select: {
                id: true,
                horaFim: true,
                horaInicio: true,
                Pessoa: true,
                DiasTrabalho: {
                    select: {
                        diaSemana: true
                    }
                }
            }
        })

        if(barbersList.length === 0) {
            response['message'] = "Nenhum barbeiro encontrado..."
            return response
        }

        const barbeirosModificados = barbersList.map(barbeiro => {
            // Aqui você pode manipular os dias da semana como desejar
            const diasTrabalhoModificados = barbeiro.DiasTrabalho.map(diaTrabalho => {
              // Exemplo de manipulação: transformar o número do dia em nome do dia
              return utilsMethods.getDayName(diaTrabalho.diaSemana) // Substitua esta função pela sua lógica de transformação
            })
          
            return {
              ...barbeiro,
              DiasTrabalho: diasTrabalhoModificados, // Substitui o array original pelo modificado
            };
        });

        response['data']['barbers'] = barbeirosModificados
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

        const barber = await prisma.barbeiro.create({
            data: {
                idPessoa: body['idPessoa'],
                idEstabelecimento: body['idEstabelecimento'], 
                horaInicio: body['startHour'],
                horaFim: body['endHour'],
            }
        })

        if(!barber) {
            response['message'] = "erro ao criar barbeiro"
            return response
        }

        const changePerson = await prisma.pessoa.update({
            data: {
                isBarber: true
            },
            where: {
                id: body['idPessoa']
            }
        })

        if(!changePerson) {
            response['message'] = 'erro ao atualizar cadastro do usuario'
            return response
        }

        let daysData = [];
        for (let index = body['dayStart']; index <= body['dayEnd']; index++) {
            daysData.push({
                idBarbeiro: barber['id'],
                diaSemana: index,
            });
        }

        // Usando createMany para inserir os dados
        const result = await prisma.diastrabalho.createMany({
            data: daysData,
            skipDuplicates: true, // Opcional: pula registros duplicados se true
        });

        // Verificar se os registros foram inseridos com sucesso
        let didInsert = result.count === daysData.length;

        let daysArray = [];
        if (didInsert) {
            daysData.forEach(day => {
                let dayObject = {
                    dia: utilsMethods.getDayName(day.diaSemana),
                    horarioInicio: barber['horaInicio'],
                    horarioFim: barber['horaFim']
                };
                daysArray.push(dayObject);
            });
        }
        
        if(!didInsert) {
            response['message'] = "Erro ao inserir dias de trabalho"
            return response
        }

        response['status'] = true
        response['data']['barber'] = barber
        response['data']['horarios'] = daysArray
        response['message'] = 'Barbeiro inserido com sucesso!!'

        return response
    }
}