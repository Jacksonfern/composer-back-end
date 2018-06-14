/*------------LISTA DO QUE FALTA-------------------
    *criar questões e vincular a um questionário
    *pegar id_questionário CORRETAMENTE (como que se faz isso),
    *utilizar a notacao JSON corretamente,
    *falta definir a variável N
--------------------------------------------------*/

exports.gerarVersoes = function(params, app){
    var id_questionario = params.id;
    var conn = app.config.connection();
    var questionario = new app.app.models.questionarios(conn);

    questionario.questions(id_questionario, function(err, result){
        if(err){
            console.log("Erro ao se conectar com o banco de dados!" + err.msg);
            return;
        }
        var id_questoes = [];
        for(var i = 0; i < result.length; i++){
            id_questoes.push(result[i].id);
        }

        questionario.getLastID(function(err, result){
            if(err){
                console.log("Erro ao conectar com o banco de dados! " + err.msg);
                return;
            }

            var id_versao = result.id;
            for(var i = 0; i < N; i++){
                id_versao++;
                var ordem = "";
                var aux = id_questoes.slice();
                var index = 0;
                
                while(aux.length > 1){
                    index = (index + i) % aux.length;
                    ordem += aux.splice(index, 1)[0] + ",";
                }
                ordem += aux[0];

                let versaoQuestionario = {
                    id_versao_questionario : id_versao,
                    OA_questao_id_questionario : id_questionario,
                    ordem : ordem
                };

                questionario.addVersao(versaoQuestionario, function(err, result){
                    if(err){
                        console.log("Erro ao conectar com o banco de dados!");
                        return;
                    }
                });
            }
        });
    });
}

/*function gerarVersoes(vet, N){
	var versoes = [vet];
	for(var i = 2; i <= N; i++){
		var list = [];
		var aux = vet.slice();
		var index = 0;

		while(aux.length > 0){
			index = (index + i) % (aux.length);
      var el = aux.splice(index, 1)[0];
			list.push(el);
		}
		versoes.push(list);
	}
	return versoes;
}*/