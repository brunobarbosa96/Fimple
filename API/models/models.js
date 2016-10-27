var Waterline = require('../Login/node_modules/waterline');

module.exports = () => {

    var orm = new Waterline();

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'entidade',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Nome: { type: 'string', required: true },
            Cep: { type: 'integer' },
            Categorias: {
                collection: 'categoria',
                via: 'Entidade'
            },
            Comentarios: {
                collection: 'notificacao',
                via: 'Entidade'
            },
            Publicacoes: {
                collection: 'publicacao',
                via: 'Entidade'
            },
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'categoria',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Nome: { type: 'string', required: true },
            Entidade: {
                model: 'entidade'
            },
            Cursos: {
                collection: 'curso',
                via: 'Categoria'
            },
            Comentarios: {
                collection: 'notificacao',
                via: 'Categoria'
            },
            Publicacoes: {
                collection: 'publicacao',
                via: 'Categoria'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'curso',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Nome: { type: 'string', required: true },
            Categoria: {
                model: 'categoria'
            },
            Usuarios: {
                collection: 'usuario',
                via: 'Curso'
            },
            Comentarios: {
                collection: 'notificacao',
                via: 'Curso'
            },
            Publicacoes: {
                collection: 'publicacao',
                via: 'Curso'
            },
            Eventos: {
                collection: 'evento',
                via: 'Curso'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'usuario',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Senha: { type: 'string', required: true },
            Rgm: { type: 'integer', required: true },
            Nome: { type: 'string', required: true },
            Sobrenome: { type: 'string', required: true },
            Apelido: { type: 'string' },
            Email: { type: 'string', required: true },
            DataNascimento: { type: 'date', required: true },
            DataInicioCurso: { type: 'date', required: true },
            Cep: { type: 'integer' },
            DataUltimoAcesso: { type: 'date' },
            Curso: {
                model: 'curso'
            },
            Evento: {
                model: 'evento'
            },
            UsuariosBloqueados: {
                collection: 'usuario',
                via: 'Id'
            },
            Notificacoes: {
                collection: 'notificacao',
                via: 'Usuario'
            },
            Comentarios: {
                collection: 'comentario',
                via: 'Usuario'
            },
            Publicacoes: {
                collection: 'publicacao',
                via: 'Usuario'
            },
            EventoParticipacao: {
                model: 'evento'
            },
            Eventos: {
                collection: 'evento',
                via: 'Usuario'
            },
            ConversasRemetente: {
                collection: 'conversa',
                via: 'Remetente'
            },
            ConversasDestino: {
                collection: 'conversa',
                via: 'Destino'
            },
            Mensagens: {
                collection: 'mensagem',
                via: 'UsuarioEnvio'
            }
}
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'notificacao',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            DataVisualizacao: { type: 'date', required: true },
            Usuario: {
                model: 'usuario'
            },
            Evento: {
                model: 'evento'
            },
            Publicacao: {
                model: 'publicacao'
            },
            ComentariosEvento: {
                collection: 'comentario',
                via: 'NotificacaoEvento'
            },
            ComentariosPublicacao: {
                collection: 'comentario',
                via: 'NotificacaoPublicacao'
            },
            Curso: {
                model: 'curso'
            },
            Entidade: {
                model: 'entidade'
            },
            Categoria: {
                model: 'categoria'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'publicacao',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Titulo: { type: 'string', required: true },
            Conteudo: { type: 'string', required: true },
            Ativa: { type: 'boolean', required: true },
            Data: { type: 'date', required: true },
            Usuario: {
                model: 'usuario'
            },
            Entidade: {
              model: 'entidade'  
            },
            Categoria: {
              model: 'categoria'  
            },
            Curso: {
                model: 'curso'
            },
            Notificacoes: {
                collection: 'notificacao',
                via: 'Publicacao'
            },

        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'comentario',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Conteudo: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true },
            Usuario: {
                model: 'usuario'
            },
            NotificacaoEvento: {
                model: 'notificacao'
            },
            NotificacaoPublicacao: {
                model: 'notificacao'
            },
            Evento: {
                model: 'evento'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'evento',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Descricao: { type: 'string', required: true },
            Local: { type: 'string', required: true },
            Data: { type: 'date', required: true },
            Usuario: {
              model: 'usuario'  
            },
            Curso: {
                model: 'curso'
            },
            Participantes: {
                collection: 'usuario',
                via: 'Evento'
            },
            Comentarios: {
                collection: 'comentario',
              via : 'Evento'
            },
            Notificacoes: {
                collection: 'notificacao',
                via: 'Evento'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'conversa',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Data: { type: 'date', required: true },
            Ativo: { type: 'boolean', required: true },
            Remetente: {
                model: 'usuario'
            },
            Destino: {
                model: 'usuario'
            },
            Mensagem: {
                collection: 'mensagem',
                via: 'Conversa'
            }
        }
    }));

    orm.loadCollection(Waterline.Collection.extend({
        identity: 'mensagem',
        connection: 'myLocalSql',
        attributes: {
            Id: { type: 'integer', primaryKey: true, autoIncrement: true },
            Conteudo: { type: 'string', required: true },
            DataEnvio: { type: 'date', required: true },
            DataRecebimento: { type: 'date', required: true },

            IdConversa: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'conversa', on: 'Id' },
            IdUsuarioEnvio: { type: 'integer', required: true, unique: true, foreignKey: true, references: 'usuario', on: 'Id' },

            Conversa: {
                model: 'conversa'
            },
            UsuarioEnvio: {
                model: 'usuario'
            }
        }
    }));

    return orm;
}
