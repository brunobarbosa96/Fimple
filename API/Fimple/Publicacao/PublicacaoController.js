module.exports = (app) => {

    var repository = require('./PublicacaoRepository')(app);
    var controller = {

        get: (req, res) => {
            repository.get(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao buscar publicações");
                if (!row)
                    res.status(204).json("Nenhum registro encontrado");
                else
                    res.status(200).json(row);
            });
        },

        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (err)
                    res.status(500).json("Erro ao inserir publicação");
                else
                    res.status(200).json(row);
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