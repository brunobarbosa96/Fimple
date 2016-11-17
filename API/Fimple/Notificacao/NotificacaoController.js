module.exports = (app) => {

    var repository = require('./NotificacaoRepository')(app);
    var controller = {

        get: (req, res) => {

            repository.get(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar notifica��es");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado");
                else
                    res.status(200).json(row);
            });
        },

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao inserir notifica��o");
                else
                    res.status(200).json(row);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao atualizar notifica��o");
                else
                    res.status(200).json(row);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao excluir notifica��o");
                else
                    res.status(200).json(row);
            });
        }
    };

    return controller;
};