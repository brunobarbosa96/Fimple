module.exports = (app) => {

    var controller = require('../Usuario/UsuarioController')(app);
    app.get('/api/usuario/', controller.getAll);
    app.get('/api/usuario/:Id', controller.get);
    app.post('/api/usuario/', controller.post);
    app.put('/api/usuario/', controller.put);

    //usuario bloqueado

    var controllerBloqueado = require('../Usuario/UsuarioBloqueado/UsuarioBloqueadoController')(app);
    app.get('/api/usuario/bloqueado/:Id', controllerBloqueado.getAll);

};