function editPerfil(idPerfil) {
    $.get('/gimnasio/administracion/perfil/edit', {idPerfil: idPerfil}, setFormulario);
}
function setFormulario(datos) {
//    console.log(datos);
    $("#divContenido").html(datos);
    $('#modalFormulario').modal('show');
}
function confirmarPassword() {
    if (parseInt($("#PASSWORD").val()) !== parseInt($("#PASSWORDSEGURO").val())) {
        alert("Contraseña no son iguales");
        $("#PASSWORD").val("");
        $("#PASSWORDSEGURO").val("");

    }
}

//----------------------------------------------------------------------------------

//mensajes
function init_compose(idUsuario) {
    $.get('/gimnasio/administracion/perfil/chat', {idUsuario: idUsuario}, init_wysiwyg);
    "undefined" != typeof $.fn.slideToggle && (console.log("init_compose"), $("#compose, .compose-close").click(function () {
        $(".compose").slideToggle()
    }))
}


function init_wysiwyg(datos) {
     $("#editor").html(datos);
    function b(a, b) {
        var c = "";
        "unsupported-file-type" === a ? c = "Unsupported format " + b : console.log("error uploading file", a, b), $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button><strong>File upload error</strong> ' + c + " </div>").prependTo("#alerts")
    }
    "undefined" != typeof $.fn.wysiwyg && (console.log("init_wysiwyg"), $(".editor-wrapper").each(function () {
        var a = $(this).attr("id");
        $(this).wysiwyg({toolbarSelector: '[data-target="#' + a + '"]', fileUploadError: b})
    }), window.prettyPrint, prettyPrint())
}

$("body").popover({selector: "[data-popover]", trigger: "click hover", delay: {show: 50, hide: 400}}), $(document).ready(function () {
    init_wysiwyg(), init_compose()
});
//fin mensajes
