module.exports = function(app){
    app.get('/', function(req, res){
        res.render("index");
    });
    
    app.post('/gerarVersoes', function(req, res){
        app.app.controllers.questionario.gerarVersoes(req.body, app);
        res.redirect('/');
    });
}