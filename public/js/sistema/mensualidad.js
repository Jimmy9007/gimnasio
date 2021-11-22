function verAgregarMensualidad() {
    $.get('/gimnasio/administracion/mensualidad/add', {}, setFormulario);
}
function verDetalle(idMensualidad) {
    $.get('/gimnasio/administracion/mensualidad/detail', {idMensualidad: idMensualidad}, setFormulario);
}
function verEditar(idMensualidad) {
    $.get('/gimnasio/administracion/mensualidad/edit', {idMensualidad: idMensualidad}, setFormulario);
}
//--------------------
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}

//------------------------------------------------------------------------------

//Hace el flitro para mesualidad 
function seleccionarUsuario() {
    $.get('/gimnasio/administracion/usuario/seleccionarUsuarioMensualidad', {}, setSeleccionarUsuarios);
}

function setSeleccionarUsuarios(datos) {
    $("#divAnexarUsuario").html(datos); //pone los datos
    $("#tblUsuarios").DataTable({
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
    $('#modalAnexarUsuario').modal('show'); //este muetra mustra los datosyy
}

function selectUsuario(idUsuario) {
    $.get('/gimnasio/administracion/usuario/getUsuario', {idUsuario: idUsuario}, setUsuario);
}
function setUsuario(datos) {
    $("#modalAnexarUsuario").modal('hide');
    $("#divInfoUsuario").html(datos);
    $("#divInfoUsuario").show('slow');
    $("#fk_usuario_id").val($("#pk_usuario_id").val());
}

function validarGuardar() {
    if ($("#fk_usuario_id").val() === '') {
        alert('DEBE SELECCIONAR UN USUARIO PARA CONTINUAR');
//        $("#selectUsu").focus();
        return false;
    }
    return confirm("¿ DESEA REGISTRAR LA MENSUALIDAD ?");
}

function enviarPreaviso() {
    var idsMensualidades = '';
    $("input[type=checkbox]:checked").each(function () {
        idsMensualidades += this.value + ',';
    });
    if (idsMensualidades === '') {
        alert("SELECCIONE ALMENOS UN USUARIO");
        return;
    } else {
        console.log(idsMensualidades);
        $("#idsMensualidades").val(idsMensualidades);
        $("#frmEnviarPreaviso").submit();
    }


}
function ponerAnio() {
    var anio = $("#selectAnio").val();
    alert(anio);
    location.href = "?anio=" + anio;
}