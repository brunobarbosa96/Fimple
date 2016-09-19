module.exports = (app) => {

    var repository = require('./ExemploRepository')(app);
    var controller = {

        getAll: (req, res) => {

            repository.getAll(req, res, (err, row) => {
                if (!row[0].length)
                    res.status(204).json({ "message": "Nenhum registro encontrado." });
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        }
    };

    return controller;
};