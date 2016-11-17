module.exports = (app) => {

    var repository = require('./ExemploRepository')(app);
    var controller = {

        getAll: (req, res) => {

            repository.getAll(req, res, (err, row) => {
                if (!row[0].length)
                    res.status(204).json("Nenhum registro encontrado.");
                if (err)
                    res.status(500).json("Erro do exemplo");
                else
                    res.status(200).json(row[0]);
            });
        }
    };

    return controller;
};