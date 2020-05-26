function verAgregarEjercicios() {
    $.get('/gimnasio/administracion/ejercicios/add', {}, setFormulario);
}
function verDetalle(idEjercicios) {
    $.get('/gimnasio/administracion/ejercicios/detail', {idEjercicios: idEjercicios}, setFormulario);
}
function verEditar(idEjercicios) {
    $.get('/gimnasio/administracion/ejercicios/edit', {idEjercicios: idEjercicios}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
function detalleEjercicio(idEjercicio) {
    $.post('/gimnasio/administracion/ejercicios/getDetalleEjercicio', {idEjercicio: idEjercicio}, getDetalleEjercicio);
    
}
function getDetalleEjercicio(datos) {
     $("#divDetalle").html(datos);
    $("#dlgDetalles").modal('show');
}