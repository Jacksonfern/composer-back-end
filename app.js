var app = require('./config/server');

app.listen(3000, function(){
    console.log("Servidor ON!");
});

app.get('/', function(req, res){
    res.send("PÀGINA INICIAL");
});

app.get('/gerarVersoes', function(req, res){
    app.app.controllers.questionario.gerarVersoes(req.query, app);
});