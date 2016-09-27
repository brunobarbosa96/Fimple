module.exports = (app) => {

    var repository = require('./LoginRepository')(app);
    var controller = {
        post: (req, res) => {
            repository.post(req, res, (err, row) => {
                if (!row.length)
                    res.status(401).json({ "Não autorizado": "Login e/ou senha inválido(s)." });
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        }
    };

    return controller;
};