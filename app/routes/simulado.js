module.exports = function(app){
    app.get('/criarSimulado', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.createSimulado(req.query, res);
    });

    app.post('/simulado', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.gerarVersoesSimulados(req.body, res);
    });
}