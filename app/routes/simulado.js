module.exports = function(app){
    app.post('/simulado', function(req, res){
        var simulado = require('../controllers/simulado');
        simulado.getQuestionarios(req.body, res);
    });
}