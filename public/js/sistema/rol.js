function verAgregarRol() {
    $.get('/gimnasio/administracion/rol/add', {}, setFormulario);
}
function verDetalle(idRol) {
    $.get('/gimnasio/administracion/rol/detail', {idRol: idRol}, setFormulario);
}
function verEditar(idRol) {
    $.get('/gimnasio/administracion/rol/edit', {idRol: idRol}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
