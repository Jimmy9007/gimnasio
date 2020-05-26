function verAgregarVenta() {
    $.get('/gimnasio/administracion/venta/add', {}, setFormulario);
}
function verDetalle(idVenta) {
    $.get('/gimnasio/administracion/venta/detail', {idVenta: idVenta}, setFormulario);
}
function verEditar(idVenta) {
    $.get('/gimnasio/administracion/venta/edit', {idVenta: idVenta}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}
function eliminar(idVenta) {
    if (confirm("¿ DESEA ELIMINAR ESTA VENTA ?")) {
        $.post('/gimnasio/administracion/venta/delete', {idVenta: idVenta}, setEliminar, 'json');
        location.reload();
    }
}
function setEliminar(datos) {
    if (datos['eliminado']) {
        alert(" VENTA ELIMINADO DEL SISTEMA ");
    } else {
        alert(" LA VENTA NO FUE ELIMINADO \n\n SE HA PRESENTADO UN COMPORTAMIENTO INESPERADO EN EL SISTEMA \n EN CASO DE PERSISTIR ESTE COMPORTAMIENTO COMUNIQUESE CON EL ADMINISTRADOR");
    }
}

//------------------------------------------------------------------------------
function seleccionarProducto() {
    var idVenta = $("#pk_venta_id").val();
    $.get('/gimnasio/administracion/producto/seleccionarProducto', {idVenta: idVenta}, setSeleccionarProductos);
}

function seleccionarProducto2(idVenta) {
    $.get('/gimnasio/administracion/producto/seleccionarProducto', {idVenta: idVenta}, setSeleccionarProductos);
    $("#idVentaSelect").val(idVenta);
}
function setSeleccionarProductos(datos) {
    $("#divAnexarProducto").html(datos);//pone los datos
    $("#tblProductos").DataTable({
        responsive: true,
        "iDisplayLength": 25,
        "sPaginationType": "full_numbers",
        "oLanguage": {
            "sLengthMenu": "Mostrar: _MENU_ registros por pagina",
            "sZeroRecords": "NO SE HA ENCONTRADO INFORMACION",
            "sInfo": "Mostrando <b>_START_</b> a <b>_END_</b> registros <br>TOTAL REGISTROS: <b>_TOTAL_</b> Registros</b>",
            "sInfoEmpty": "Mostrando 0 A 0 registros",
            "sInfoFiltered": "(Filtrados de un total de <b>_MAX_</b> registros)",
            "sLoadingRecords": "CARGANDO...",
            "sProcessing": "EN PROCESO...",
            "sSearch": "Buscar:",
            "sEmptyTable": "NO HAY INFORMACION DISPONIBLE PARA LA TABLA",
            "oPaginate": {
                "sFirst": "Inicio",
                "sLast": "Fin",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            }
        },
        "aaSorting": [[0, "asc"]]
    });
    $('#modalAnexarProducto').modal('show');//este muetra mustra los datos
}

function selectProducto(idProducto) {
    $.get('/gimnasio/administracion/producto/getProducto', {idProducto: idProducto}, setProducto);
}
function addProducto() {
    if ($("#fk_producto_id").val() == '') {
        alert("DEBE SELECCIONAR UN PRODUCTO");
    } else if ($("#cantidadVenta").val() == '') {
        alert("DEBE INGRSAR CANTIDAD");
    } else {
        var idVenta = $("#pk_venta_id").val();
        var idProducto = $("#pk_producto_id").val();
        var cantidad = $("#cantidadVenta").val();
        var valorTotal = $("#valorTotal").val();
        $.get('/gimnasio/administracion/venta/addCarrito', {idProducto: idProducto, cantidad: cantidad, valorTotal: valorTotal, idVenta: idVenta}, );

    }
}
function setProducto(datos) {
    $("#divAddProducto").html(datos);//pone los datos
    $('#modalAddProducto').modal('show');//este muetra mustra los datos
    $("#fk_producto_id").val($("#pk_producto_id").val());
    $("#divInfoProducto").show('slow');
    limpiarCampo();
}

function validarGuardar() {
    if ($("#fk_producto_id").val() == '') {
        alert("DEBE SELECCIONAR UN PRODUCTO");
        return false;
    } else if ($("#cantidadVenta").val() == '') {
        alert("DEBE INGRSAR CANTIDAD");
        return false;
    } else {
        return true;
    }
}
//------------------------------------------------------------------------------

function operacionesVenta() {
    var cantidad = $("#cantidadVenta").val();
    var precio = $("#precioVenta").val();
    var precioCosto = $("#precioCosto").val();

    var vTotal = cantidad * precio;
    var vGanancia = (precio - precioCosto) * cantidad;
    $("#valorTotal").val(vTotal);
    $("#ganancia").val(vGanancia);

}
function limpiarCampo() {
    $("#cantidadVenta").val("");
    $("#valorTotal").val("");
    $("#ganancia").val("");
}


function anexarArticulo(idVenta) {
    location.href = 'anexarArticulo/' + idVenta;
}