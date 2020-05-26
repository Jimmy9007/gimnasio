function verAgregarUsuario() {
    $.get('/gimnasio/administracion/usuario/add', {}, setFormulario);
}
function verDetalle(idUsuario) {
    $.get('/gimnasio/administracion/usuario/detail', {idUsuario: idUsuario}, setFormulario);
}
function verEditar(idUsuario) {
    $.get('/gimnasio/administracion/usuario/edit', {idUsuario: idUsuario}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
function detalleUsuario(idUsuario) {
    $.post('/gimnasio/administracion/usuario/getDetalleUsuario', {idUsuario: idUsuario}, getDetalleUsuario);

}
function medidasUsuario(idUsuario) {
    $.post('/gimnasio/administracion/usuario/getMedidasUsuario', {idUsuario: idUsuario}, getMedidasUsuario);

}
function getDetalleUsuario(datos) {
    $("#divDetalle").html(datos);
    $("#dlgDetalles").modal('show');
}
function getMedidasUsuario(datos) {
    $("#divMedidas").html(datos);
    $("#dlgMedidas").modal('show');
}

function confirmarPassword() {
    var password = $("#PASSWORD").val();
    var passwordSeguro = $("#PASSWORDSEGURO").val();
    if (password !== passwordSeguro) {
        alert("Contraseña no son iguales");
        $("#PASSWORD").val("");
        $("#PASSWORDSEGURO").val("");

    }
}
//function cambiarClave() {
//    $.get('/gimnasio/administracion/usuario/edit');
//    document.getElementById("PASSWORD").readOnly = false;
//    document.getElementById("PASSWORDSEGURO").readOnly = false;
//    $("#PASSWORD").val("");
//    $("#PASSWORDSEGURO").val("");
//}