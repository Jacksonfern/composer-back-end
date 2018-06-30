module.exports = function(app){
    app.get('/criarsimulado', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.criarSimulado(req.query, res);
    });

    app.get('/vincularquestionario', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.addQuestionarios(req.query, res);
    });

    app.post('/simulado', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.gerarVersoesSimulados(req.body, res);
    });
}