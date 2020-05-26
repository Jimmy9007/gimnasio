function verAgregarInstructor() {
    $.get('/gimnasio/administracion/instructor/add', {}, setFormulario);
}
function verDetalle(idInstructor) {
    $.get('/gimnasio/administracion/instructor/detail', {idInstructor: idInstructor}, setFormulario);
}
function verEditar(idInstructor) {
    $.get('/gimnasio/administracion/instructor/edit', {idInstructor: idInstructor}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
function confirmarPassword() {
    var password = $("#PASSWORD").val();
    var passwordSeguro = $("#PASSWORDSEGURO").val();
    if (password !== passwordSeguro) {
        alert("Contraseña no son iguales");
        $("#PASSWORD").val("");
        $("#PASSWORDSEGURO").val("");

    }
}