function downloadReporte() {
    if ($("#tipo_reporte").val() == '') {
        alert("Seleccione el tipo reporte que desea");
        $("#tipo_reporte").focus();
        false;
    } else {
        location.href = "?fechaInicio=" + $("#fechaInicio").val() + "&fechaFin=" + $("#fechaFin").val() + "&r=" + $("#tipo_reporte").val();
    }
    //$.get('/josandro/inventario/reporte/index', {fechaInicio: fechaInicio, fechaFin:fechaFin, seleccionado:seleccionado});
}
function ponerAnio() {    
    var anio = $("#selectAnio").val();
    location.href = "?anio=" + anio;
}