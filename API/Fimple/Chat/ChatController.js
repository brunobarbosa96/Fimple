module.exports = (app) => {

    var repository = require('./ChatRepository')(app);
    var controller = {

        getConversas: (req, res) => {

            repository.getConversas(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar conversas");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado");
                else
                    res.status(200).json(row);
            });
        },

        get: (req, res) => {

            repository.get(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar mensagens");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado");
                else
                    res.status(200).json(row);
            });
        },

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao inserir mensagem");
                else
                    res.status(200).json(row);
            });
        },

        put: (req, res) => {
            repository.put(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao atualizar mensagem");
                else
                    res.status(200).json(row);
            });
        },

        delete: (req, res) => {
            repository.delete(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao excluir mensagem");
                else
                    res.status(200).json(row);
            });
        }
    };

    return controller;
};