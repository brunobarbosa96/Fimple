module.exports = (app) => {
   
    var controller = require('../Publicacao/PublicacaoController.js')(app);
    app.get('/api/timeLine/Publicacao/', controller.get);
    app.post('/api/timeLine/Publicacao/', controller.post);
    app.put('/api/timeLine/Publicacao/', controller.put);
    app.delete('/api/timeLine/Publicacao/:Id', controller.delete);
};