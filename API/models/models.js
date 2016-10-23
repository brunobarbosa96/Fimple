var Waterline = require('../Login/node_modules/waterline');

module.exports = () => {

    var orm = new Waterline();

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'entidade',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            Nome: { type: 'string', required: true },
            Cep: { type: 'integer' }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'categoria',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdEntidade: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'entidade', on: 'Id' },
            Nome: { type: 'string', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'curso',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdCategoria: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'categoria', on: 'Id' },
            Nome: { type: 'string', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'usuario',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdCurso: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'curso', on: 'Id' },
            Senha: { type: 'string', required: true },
            Rgm: { type: 'integer', required: true },
            Nome: { type: 'string', required: true },
            Sobrenome: { type: 'string', required: true },
            Apelido: { type: 'string' },
            Email: { type: 'string', required: true },
            DataNascimento: { type: 'date', required: true },
            Cep: { type: 'integer' },
            DataCadastro: { type: 'date' },
            DataUltimoAcesso: { type: 'date' },
            DataInicioCurso: { type: 'date', required: true },

            UsuarioBloqueado: {
                collection: 'usuarioBloqueado',
                via: 'owner'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'notificacao',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdUsuario: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            IdEvento: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'evento', on: 'Id' },
            IdComentarioEvento: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'comentarioEvento', on: 'Id' },
            IdPublicacao: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'publicacao', on: 'Id' },
            IdComentarioPublicacao: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'comentarioPublicacao', on: 'Id' },
            IdCurso: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'curso', on: 'Id' },
            IdCategoria: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'categoria', on: 'Id' },
            DataCadastro: { type: 'date', required: true },
            DataVisualizacao: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'publicacao',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdUsuario: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            IdEntidade: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'entidade', on: 'Id' },
            IdCategoria: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'categoria', on: 'Id' },
            IdCurso: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'curso', on: 'Id' },
            Titulo: { type: 'string', required: true },
            Conteudo: { type: 'string', required: true },
            Ativa: { type: 'boolean', required: true },
            Data: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'comentarioPublicacao',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdPublicacao: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'publicacao', on: 'Id' },
            IdUsuario: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Comentario: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'visualizacaoPublicacao',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            IdPublicacao: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'publicacao', on: 'Id' },
            IdUsuario: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Data: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'evento',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdUsuario: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Descricao: { type: 'string', required: true },
            Local: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            DataCadastro: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'comentarioEvento',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdEvento: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'evento', on: 'Id' },
            IdUsuario: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Comentario: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'eventoUsuarios',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            IdEvento: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'evento', on: 'Id' },
            IdUsuario: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'usuario', on: 'Id' }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'conversa',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdUsuarioRemetente: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            IdUsuarioDestino: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'mensagem',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            Id: { type: 'integer', primaryKey: true },
            IdConversa: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'conversa', on: 'Id' },
            IdUsuarioEnvio: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },
            Mensagem: { type: 'string', required: true },
            DataEnvio: { type: 'date', required: true },
            DataRecebimento: { type: 'date', required: true }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'usuarioBloqueado',
        connection: 'myLocalSql',
        autoCreatedAt: false,
        autoUpdatedAt: false,
        attributes: {
            IdUsuarioBloqueado: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'usuario', on: 'Id' },
            IdUsuarioBloqueou: { type: 'integer', primaryKey: true, required: true, foreignKey: true, references: 'usuario', on: 'Id' },

            owner: {
                model: 'usuario'
            }
        }
    }));

    return orm;
}
