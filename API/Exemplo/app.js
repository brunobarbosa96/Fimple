var express = require('express'),
    bodyParser = require('body-parser'),
    load = require('express-load'),
    Waterline = require('waterline'),
    config = require('../config/config.js');

app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

load('Routes').then('models').into(app);

var orm = new Waterline();

var collection = Waterline.Collection.extend(app.models);
orm.loadCollection(collection);

orm.initialize(config, (err, data) => {
    if (err)
        console.log("Erro ao instanciar ORM: " + err);
    else {
        app.models = data.collections;
    }
});

app.listen(2828, () => {
    console.log("Server up on port " + 2828);
});