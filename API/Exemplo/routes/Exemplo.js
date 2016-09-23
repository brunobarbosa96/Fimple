module.exports = (app) => {
   
    var controller = require('../Exemplo/ExemploController')(app);
    app.get('/api/exemplo/', controller.getAll);

};