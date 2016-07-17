module.exports = (app) => {
    var controller = {

        getAll: (req, res) => {
            app.repository.consultaRepository.getAll(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        },

        getById: (req, res) => {
            app.repository.consultaRepository.getById(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        },

        getByName: (req, res) => {
            app.repository.consultaRepository.getByName(req, res, (err, row) => {
                if (err)
                    res.status(500).json({ "message": err });
                else
                    res.status(200).json(row[0]);
            });
        }

    };

    return controller;
};