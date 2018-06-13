/*module.exports.gerarVersoes = function(vet, N){
    for(i = 1; i <= N; i++){
        var list = []
        var aux = vet;

        while(aux.length > 0){
            list.push(aux[i % 2]);
            aux.splice(i % 2, 1);
        }
        console.log(list);
    }
}*/

function gerarVersoes(vet, N){
    for(var i = 1; i <= N; i++){
        var list = []
        var aux = vet;

        while(aux.length > 0){
            list.push(aux[i % 2]);
            aux.splice(i % 2, 1);
        }
        console.log(list);
        return list;
    }
}