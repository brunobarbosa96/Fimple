module.exports = (app) => {

    var repository = require('./LoginRepository')(app);
    var controller = {
        postLogin: (req, res) => {
            repository.postLogin(req, res, (err, row) => {
                if (!row[0].length)
                    res.status(403).json({"Não autorizado": "Login e/ou senhá inválido(s)."})
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        }
    };

    return controller;
};