var Waterline = require('../Login/node_modules/waterline');

module.exports = () => {

    var orm = new Waterline();

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'entidade',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            Nome: { type: 'string', required: true },
            Cep: { type: 'integer' }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'categoria',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdEntidade: { type: 'integer', required: true, unique: true },
            Nome: { type: 'string', required: true }
        }
    }));


    orm.loadCollection(Waterline.Collection.extend({
        identity: 'curso',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdCategoria: { type: 'integer', required: true, unique: true },
            Nome: { type: 'string', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'usuario',
        connection: 'myLocalSql',
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
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'notificacao',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdUsuario: { type: 'integer', required: true, unique: true },
            IdEvento: { type: 'integer', required: true, unique: true },
            IdComentarioEvento: { type: 'integer', required: true, unique: true },
            IdPublicacao: { type: 'integer', required: true, unique: true },
            IdComentarioPublicacao: { type: 'integer', required: true, unique: true },
            IdCurso: { type: 'integer', required: true, unique: true },
            IdCategoria: { type: 'integer', required: true, unique: true },
            DataCadastro: { type: 'date', required: true },
            DataVisualizacao: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'publicacao',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdUsuario: { type: 'integer', required: true, unique: true },
            IdEntidade: { type: 'integer', required: true, unique: true },
            IdCategoria: { type: 'integer', required: true, unique: true },
            IdCurso: { type: 'integer', required: true, unique: true },
            Titulo: { type: 'string', required: true },
            Conteudo: { type: 'string', required: true },
            Ativa: { type: 'boolean', required: true },
            Data: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'comentarioPublicacao',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdPublicacao: { type: 'integer', required: true, unique: true },
            IdUsuario: { type: 'integer', required: true, unique: true },
            Comentario: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'visualizacaoPublicacao',
        connection: 'myLocalSql',
        attributes: {
            IdPublicacao: { type: 'integer', primaryKey: true, required: true },
            IdUsuario: { type: 'integer', primaryKey: true, required: true },
            Data: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'evento',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdUsuario: { type: 'integer', required: true, unique: true },
            Descricao: { type: 'string', required: true },
            Local: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            DataCadastro: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'comentarioEvento',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdEvento: { type: 'integer', required: true, unique: true },
            IdUsuario: { type: 'integer', required: true, unique: true },
            Comentario: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'eventoUsuarios',
        connection: 'myLocalSql',
        attributes: {
            IdEvento: { type: 'integer', primaryKey: true, required: true },
            IdUsuario: { type: 'integer', primaryKey: true, required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'conversa',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdUsuarioRemetente: { type: 'integer', required: true, unique: true },
            IdUsuarioDestino: { type: 'integer', required: true, unique: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'mensagem',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, required: true },
            IdConversa: { type: 'integer', required: true, unique: true },
            IdUsuarioEnvio: { type: 'integer', required: true, unique: true },
            Mensagem: { type: 'string', required: true },
            DataEnvio: { type: 'date', required: true },
            DataRecebimento: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'usuarioBloqueado',
        connection: 'myLocalSql',
        attributes: {
            IdUsuarioBloqueado: { type: 'integer', primaryKey: true, required: true },
            IdUsuarioBloqueou: { type: 'integer', primaryKey: true, required: true }
        }
    }));

    return orm;
}
