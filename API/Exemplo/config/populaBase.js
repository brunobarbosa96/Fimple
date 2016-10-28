    //app.models.entidade.create({
    //    Nome: "UNIFRAN",
    //    Cep: 14404600,
    //}).exec((err, row) => {
    //    console.log(err, row);
    //    });
    //app.models.categoria.create({
    //    Nome: "CIÊNCIAS TECNOLÓGICAS",
    //    Entidade: 1
    //}).exec((err, row) => {
    //    console.log(err, row);
    //});
    //app.models.curso.create({
    //    Nome: "CIÊNCIA DA COMPUTAÇÃO",
    //    Categoria:1,
    //}).exec((err, row) => {
    //    console.log(err, row);
    //});


app.models.curso.update({ Id: 1 }, {
    Nome: "CIENCIA DA COMPUTACAO",
    Categoria: 1,
}).exec((err, row) => {
    console.log(err, row);
});
