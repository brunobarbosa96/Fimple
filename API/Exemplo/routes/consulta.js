module.exports = (app) => {
    var controller = app.controllers.consultaController;
    app.get('/api/consulta', controller.getAll);
    app.get('/api/consulta/codigo/:id', controller.getById);
    app.get('/api/consulta/nome/:name', controller.getByName);
};