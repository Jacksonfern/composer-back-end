var express = require('express');
var consign = require('consign');
var bodyParser = require('body-parser');

var app = express();
app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.urlencoded({extended : true}));
consign()
    .include()
    .into(app);
    
module.exports = app;