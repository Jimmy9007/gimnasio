function verAgregarProducto() {
    $.get('/gimnasio/administracion/producto/add', {}, setFormulario);
}
function verDetalle(idProducto) {
    $.get('/gimnasio/administracion/producto/detail', {idProducto: idProducto}, setFormulario);
}
function verEditar(idProducto) {
    $.get('/gimnasio/administracion/producto/edit', {idProducto: idProducto}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}
function eliminar(idProducto) {
    if (confirm("¿ DESEA ELIMINAR ESTE PRODUCTO ?")) {
        $.post('/gimnasio/administracion/producto/delete', {idProducto: idProducto}, setEliminar, 'json');
        location.reload();
    }
}
function setEliminar(datos) {
    if (datos['eliminado']) {
        alert(" PRODUCTO ELIMINADO DEL SISTEMA ");
        location.reload();
    } else {
        alert(" EL PRODUCTO NO FUE ELIMINADO \n\n SE HA PRESENTADO UN COMPORTAMIENTO INESPERADO EN EL SISTEMA \n EN CASO DE PERSISTIR ESTE COMPORTAMIENTO COMUNIQUESE CON EL ADMINISTRADOR");
    }
}

//------------------------------------------------------------------------------
function detalleProducto(idProducto) {
    $.post('/gimnasio/administracion/producto/getDetalleProducto', {idProducto: idProducto}, setFormulario);
}
function setFormulario(datos) {
    $("#divDetalle").html(datos);
    $("#dlgDetalles").modal('show');
}
