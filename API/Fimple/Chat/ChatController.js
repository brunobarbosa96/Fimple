module.exports = (app) => {

    var repository = require('./ChatRepository')(app);
    var controller = {

        get: (req, res) => {

            repository.get(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message": "Erro ao buscar mensagens", "exception": err });
                if (!row)
                    res.status(204).json({ "message": "Nenhum registro encontrado" });
                else
                    res.status(200).json(row);
            });
        },

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao inserir mensagem", "exception": err  });
                else
                    res.status(200).json(row);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message:": "Erro ao excluir mensagem", "exception": err  });
                else
                    res.status(200).json(row);
            });
        }
    };

    return controller;
};