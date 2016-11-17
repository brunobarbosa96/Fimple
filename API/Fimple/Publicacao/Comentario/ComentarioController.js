module.exports = (app) => {

    var repository = require('./ComentarioRepository')(app);
    var notificacaoRepository = require('../../Notificacao/NotificacaoRepository')(app);
    var controller = {

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao inserir publicação");
                else
                    res.status(200).json(row);
            });

            notificacaoRepository.post(req, res, (err) => {
                if (err) console.log(err);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao atualizar publicação");
                else
                    res.status(200).json(row);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao excluir publicação");
                else
                    res.status(200).json(row);
            });
        }
    };

    return controller;
};