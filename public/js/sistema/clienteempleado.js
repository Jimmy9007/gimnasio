function bloqueoAjax() {
    $.blockUI(
            {
                message: $('#msgBloqueo'),
                css: {
                    border: 'none',
                    padding: '15px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .85,
                    color: '#fff',
                    'z-index': 10000
                }
            }
    );
    $('.blockOverlay').attr('style', $('.blockOverlay').attr('style') + 'z-index: 1100 !important');
}
function confirmarCerrar() {
    Swal.fire({
        title: 'DESEAS CERRAR EL FORMULARIO?',
        text: "JOSANDRO",
        icon: 'warning',
//        imageUrl: 'https://dobleclick.net.co/wp-content/uploads/2019/07/logo.png',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#aaa',
        confirmButtonText: '<i class="fa fa-close"></i> Confirmar',
        cancelButtonText: 'Cancelar',
    }).then(function (result) {
        if (result.value) {
            return false;
        } else {
            $('#modalFormulario').modal('toggle');
        }

    });
}
function verAgregarClienteempleado() {
    $.get('/gimnasio/administracion/clienteempleado/add', {}, setFormulario);
    bloqueoAjax();
}
function verDetalle(idClienteempleado) {
    $.get('/gimnasio/administracion/clienteempleado/detail', {idClienteempleado: idClienteempleado}, setFormulario);
    bloqueoAjax();
}
function verEditar(idClienteempleado) {
    $.get('/gimnasio/administracion/clienteempleado/edit', {idClienteempleado: idClienteempleado}, setFormulario);
    bloqueoAjax();
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------
function confirmAdd() {
    if (confirm("DESEA REGISTRAR ESTE USUARIO?")) {
        bloqueoAjax();
        return true;
    } else {
        return false;
    }
}
//------------------------------------------------------------------------------
function existeidentificacion() {
    $.get('existeidentificacion', {identificacion: $("#identificacion").val()}, setExisteIdentificacion, 'json');
    bloqueoAjax();
}
function setExisteIdentificacion(datos) {
    if (parseInt(datos['error']) === 0) {
        if (parseInt(datos['existe']) === 1) {
            Swal.fire("LA IDENTIFICACION (" + datos['identificacion'] + ") YA SE ENCUENTRA REGISTRADA EN SAPARTANS.", "SAPARTANS", 'error');
            $("#identificacion").val('');
            $("#identificacion").focus();
            return false;
        } else {
            return true;
        }
    } else {
        Swal.fire("SE HA PRESENTADO UN INCONVENIENTE EN SAPARTANS.", "SAPARTANS", "error");
        return false;
    }
}
//------------------------------------------------------------------------------