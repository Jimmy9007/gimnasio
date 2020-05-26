function verAgregarEntreno() {
    $.get('/gimnasio/administracion/entreno/add', {}, setFormulario);
}
function verDetalle(idEntreno) {
    $.get('/gimnasio/administracion/entreno/detail', {idEntreno: idEntreno}, setFormulario);
}
function verEditar(idEntreno) {
    $.get('/gimnasio/administracion/entreno/edit', {idEntreno: idEntreno}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
