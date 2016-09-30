﻿module.exports = {
    identity: 'usuario',
    connection: 'default',
    attributes: {
        Id: { type: 'integer', primaryKey: true, required: true },
        IdCurso: { type: 'integer', required: true, unique: true },
        Senha: { type: 'string', required: true },
        Rgm: { type: 'integer', required: true },
        Nome: { type: 'string', required: true },
        Sobrenome: { type: 'string', required: true },
        Apelido: { type: 'string' },
        Email: { type: 'string', required: true },
        DataNascimento: { type: 'date', required: true },
        Cep: { type: 'integer' },
        DataCadastro: { type: 'date', required: true },
        DataUltimoAcesso: { type: 'date', required: true },
        DataInicioCurso: { type: 'date', required: true }
    }
};