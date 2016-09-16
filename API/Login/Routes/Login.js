module.exports = (app) => {
   
    var controller = require('../Publicacao/PublicacaoController')(app);
    app.post('/api/timeLine', controller.postPublicacao);

};