var express = require('express'),
    bodyParser = require('body-parser'),
    load = require('express-load'),
    model = require('./config/model.js')();

app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.model = model;

load('Routes').into(app);

app.listen(2828, () => {
    console.log("Server up on port " + 2828); 
});