exports.gerarVersoes = function (params, app) {
    var id_questionario = params.id; //id questionário
    var N = params.quantidade;
    var conn = app.config.connection; //conexão com o banco de dados
    var questionario = new app.app.models.questionario(conn); //objeto que faz requisições para o banco de dados

    questionario.questions(id_questionario, function (err, result) { //Pega todas as questões vinculadas a um questionário
        if(err) {
            console.log("Erro ao se conectar com o banco de dados!" + err.msg);
            return;
        }
        
        var id_questoes = []; //Lista que vai armazenar todos os ids das questões
        for (var i = 0; i < result.length; i++) {
            id_questoes.push(result[i].id); //Adicionando
        }

        questionario.getLastID(function (err, result) { //Pega o ultimo ID da versao_questionario 
            if (err) {
                console.log("Erro ao conectar com o banco de dados! " + err.msg);
                return;
            }

            var id_versao = (result[0].id == null ? 0 : result[0].id); //Atribui o último id inserido na variável id_versao (se for null, vai receber 0)

            for(var i = 0; i < N; i++) { //Gerador de versões
                var ordem = geraVersao(id_questoes, i);
                id_versao++;

                let versaoQuestionario = { //JSON para armazenar a versao
                    id_versao_questionario: id_versao,
                    OA_questionario_id_questionario: id_questionario,
                    ordem: ordem
                };

                questionario.addVersao(versaoQuestionario, function (err, result) {
                    if (err) {
                        console.log("Erro ao conectar com o banco de dados!" + err);
                        return;
                    }
                });
            }
        });
    });
}

function geraVersao(id_questoes, seed){
    var ordem = ""; //String para armazenar a ordem
    var aux = id_questoes.slice(); //Copio o vetor
    var index = 0;

    //Algoritmo para gerar versões
    while (aux.length > 1) {
        index = (index + i) % aux.length;
        ordem += aux.splice(index, 1)[0] + ",";
    }
    ordem += aux[0];
    return ordem;
}