module.exports = (app) => {

    var usuario = app.models.usuario;
    
    var repository = {

        getAll: (req, res, callback) => {
            usuario.find().exec((err, row) => {
                console.log(res.json(row));
                return err
                    ? callback(err, null)
                    : callback(null, row);
            });
        }
    };

    return repository;
};
