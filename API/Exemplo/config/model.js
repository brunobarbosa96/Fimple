var Sequelize = require('sequelize'),
    config = require('./sqlConfiguration');

var sequelize = new Sequelize(config.database, config.user, config.password, {
    host: config.host,
    dialect: 'mssql',
    pool: {
        max: 10,
        min: 0,
        idle: 10000
    }
});

module.exports = () => {

    return {

        Entidade: sequelize.define('Entidade', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            Nome: { type: Sequelize.STRING, allowNull: false },
            Cep: { type: Sequelize.INTEGER, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Categoria: sequelize.define('Categoria', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdEntidade: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Entidade, key: 'Id' } },
            Nome: { type: Sequelize.STRING, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Curso: sequelize.define('Curso', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdCategoria: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Categoria, key: 'Id' } },
            Nome: { type: Sequelize.STRING, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Usuario: sequelize.define('Usuario', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdCurso: { type: Sequelize.STRING, allowNull: false, references: { model: this.Curso, key: 'Id' } },
            Senha: { type: Sequelize.STRING, allowNull: false },
            Rgm: { type: Sequelize.INTEGER, allowNull: false },
            Nome: { type: Sequelize.STRING, allowNull: false },
            Sobrenome: { type: Sequelize.STRING, allowNull: false },
            Apelido: { type: Sequelize.STRING, allowNull: true },
            Email: { type: Sequelize.STRING, allowNull: false },
            DataNascimento: { type: Sequelize.DATE, allowNull: false },
            Cep: { type: Sequelize.INTEGER, allowNull: true },
            DataCadastro: { type: Sequelize.DATE, allowNull: false },
            DataUltimoAcesso: { type: Sequelize.DATE, allowNull: false },
            DataInicioCurso: { type: Sequelize.DATE, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Notificacao: sequelize.define('Notificacao', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdUsuario: { type: Sequelize.DATE, allowNull: true, references: { model: this.Usuario, key: 'Id' } },
            IdEvento: { type: Sequelize.DATE, allowNull: true, references: { model: this.Evento, key: 'Id' } },
            IdComentarioEvento: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.ComentarioEvento, key: 'Id' } },
            IdPublicacao: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Publicacao, key: 'Id' } },
            IdComentarioPublicacao: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.ComentarioPublicacao, key: 'Id' } },
            IdCurso: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Curso, key: 'Id' } },
            IdEntidade: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Entidade, key: 'Id' } },
            IdCategoria: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Categoria, key: 'Id' } },
            DataCadastro: { type: Sequelize.DATE, allowNull: false },
            DataVisualizacao: { type: Sequelize.DATE, allowNull: true }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Publicacao: sequelize.define('Publicacao', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Usuario, key: 'Id' } },
            IdEntidade: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Entidade, key: 'Id' } },
            IdCategoria: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Categoria, key: 'Id' } },
            IdCurso: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Curso, key: 'Id' } },
            Titulo: { type: Sequelize.STRING, allowNull: false },
            Conteudo: { type: Sequelize.TEXT, allowNull: false },
            Ativa: { type: Sequelize.BOOLEAN, allowNull: false },
            Data: { type: Sequelize.DATE, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        ComentarioPublicacao: sequelize.define('ComentarioPublicacao', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdPublicacao: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Publicacao, key: 'Id' } },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: true, references: { model: this.Usuario, key: 'Id' } },
            Comentario: { type: Sequelize.STRING, allowNull: true },
            Data: { type: Sequelize.DATE, allowNull: true },
            Ativo: { type: Sequelize.BOOLEAN, allowNull: true }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        VisualizacaoPublicacao: sequelize.define('VisualizacaoPublicacao', {
            IdPublicacao: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Publicacao, key: 'Id' } },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Usuario, key: 'Id' } },
            Data: { type: Sequelize.DATE, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Evento: sequelize.define('Evento', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Usuario, key: 'Id' } },
            Descricao: { type: Sequelize.TEXT, allowNull: false },
            Local: { type: Sequelize.STRING, allowNull: false },
            Data: { type: Sequelize.DATE, allowNull: false },
            DataCadastro: { type: Sequelize.DATE, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        ComentarioEvento: sequelize.define('ComentarioEvento', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdEvento: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Evento, key: 'Id' } },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Usuario, key: 'Id' } },
            Comentario: { type: Sequelize.TEXT, allowNull: false },
            Data: { type: Sequelize.DATE, allowNull: false },
            Ativo: { type: Sequelize.BOOLEAN, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        EventoUsuarios: sequelize.define('EventoUsuarios', {
            IdEvento: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Evento, key: 'Id' } },
            IdUsuario: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Usuario, key: 'Id' } }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Conversa: sequelize.define('Conversa', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdUsuarioRemetente: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Usuario, key: 'Id' } },
            IdUsuarioDestino: { type: Sequelize.INTEGER, allowNull: false, references: { model: this.Usuario, key: 'Id' } },
            Data: { type: Sequelize.DATE, allowNull: false },
            Ativo: { type: Sequelize.BOOLEAN, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        Mensagem: sequelize.define('Mensagem', {
            Id: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true },
            IdConversa: { type: Sequelize.INTEGER, allowNull: false },
            IdUsuarioEnvio: { type: Sequelize.INTEGER, allowNull: false },
            Mensagem: { type: Sequelize.STRING, allowNull: false },
            DataEnvio: { type: Sequelize.DATE, allowNull: false },
            DataRecebimento: { type: Sequelize.DATE, allowNull: false }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync(),
        UsuarioBloqueado: sequelize.define('UsuarioBloqueado', {
            IdUsuarioBloqueado: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Usuario, key: 'Id' } },
            IdUsuarioBloqueou: { type: Sequelize.INTEGER, allowNull: false, primaryKey: true, references: { model: this.Usuario, key: 'Id' } }
        }, { timestamps: false, paranoid: true, underscored: true, freezeTableName: true }).sync()
    };

};
