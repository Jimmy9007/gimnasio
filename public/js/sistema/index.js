//Calendario
//function init_calendar() {
//    if ("undefined" != typeof $.fn.fullCalendar) {
//        console.log("init_calendar");
//        var e, f, a = new Date, b = a.getDate(),
//                c = a.getMonth(),
//                d = a.getFullYear(),
//                g = $("#calendar").fullCalendar({
//            header: {
//                left: "prev,next today",
//                center: "title",
//                right: "month,agendaWeek,agendaDay,listMonth"
//            },
//            selectable: !0,
//            selectHelper: !0,
//            select: function (a, b, c) {
//                $("#fc_create").click(), e = a, ended = b,
//                        $(".antosubmit").on("click", function () {
//                    var a = $("#title").val();
//                    return b && (ended = b),
//                            f = $("#event_type").val(),
//                            a && g.fullCalendar("renderEvent", {title: a, start: e, end: b, allDay: c}, !0),
//                            $("#title").val(""),
//                            g.fullCalendar("unselect"),
//                            $(".antoclose").click(), !1
//                })
//            }, eventClick: function (a, b, c) {
//                $("#fc_edit").click(),
//                        $("#title2").val(a.title),
//                        f = $("#event_type").val(),
//                        $(".antosubmit2").on("click",
//                        function () {
//                            a.title = $("#title2").val(),
//                                    g.fullCalendar("updateEvent", a),
//                                    $(".antoclose2").click()
//                        }),
//                        g.fullCalendar("unselect")
//            },
//            editable: !0,
//            events: [{title: "Entrenamiento Funcional", start: new Date(d, c, 1,10,30), end: new Date(d, c, 1,11,30)},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, 2,10,30), end: new Date(d, c, 2,11,30)},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, 3,10,30), end: new Date(d, c, 3,11,30)},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, 4,10,30), end: new Date(d, c, 4,11,30)},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, 5,10,30), end: new Date(d, c, 5,11,30)},
//                {title: "Baile Deportivo", start: new Date(d, c, b - 5), end: new Date(d, c, b - 2)},
//                {title: "crossfit", start: new Date(d, c, b, 10, 30), allDay: !1},
//                {title: "Conferencia de nutricion y dietetica", start: new Date(d, c, b + 14, 12, 0), end: new Date(d, c, b, 14, 0), allDay: !1},
//                {title: "Fiesta De Cumpleaños", start: new Date(d, c, b + 1, 19, 0), end: new Date(d, c, b + 1, 22, 30), allDay: !1},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, b + 2, 19, 0), end: new Date(d, c, b + 2, 20,), allDay: !1},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, b + 3, 19, 0), end: new Date(d, c, b + 3, 20,), allDay: !1},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, b + 4, 19, 0), end: new Date(d, c, b + 4, 20,), allDay: !1},
//                {title: "Entrenamiento Funcional", start: new Date(d, c, b + 5, 19, 0), end: new Date(d, c, b + 5, 20,), allDay: !1},
//                {title: "Ir a Google", start: new Date(d, c, 28), end: new Date(d, c, 29), url: "http://google.com/"}]})
//    }
//}

//$("body").popover({selector: "[data-popover]", trigger: "click hover", delay: {show: 50, hide: 400}}), $(document).ready(function () {
//    init_calendar()
//});
//fin calendario
function guardarEvento() {
    $.get('/gimnasio/administracion/index/add', {}, setFormulario);
}
function editarEvento(id) {
    $.get('/gimnasio/administracion/index/edit', {id: id}, setFormulario);
}
function borrarEvento(id) {
    if (confirm("¿ DESEA ELIMINAR ESTE EVENTO ?")) {
        $.post('/gimnasio/administracion/index/delete', {id: id}, setBorrar, 'json');
        location.reload();
    }
}
function setBorrar(datos) {
    if (datos['eliminado']) {
        alert(" EVENTO ELIMINADO DEL SISTEMA ");
        location.reload();
    } else {
        alert(" EL PRODUCTO NO FUE ELIMINADO \n\n SE HA PRESENTADO UN COMPORTAMIENTO INESPERADO EN EL SISTEMA \n EN CASO DE PERSISTIR ESTE COMPORTAMIENTO COMUNIQUESE CON EL ADMINISTRADOR");
    }
}
function setFormulario(datos) {
    //console.log(datos);
    $("#divContenido").html(datos);
    $('#CalenderModalNew').modal('show');
}
function ponerFecha(d) {
//    alert("Nuevo evento: " + d);
    $("#start").val(d);

}

function moverEvento(id, titulo, des, fStart, cColor, tColor, fEnd, modal) {
    $.get('/gimnasio/administracion/index/edit', {id: id, titulo: titulo, des: des, fStart: fStart, cColor: cColor, tColor: tColor, fEnd: fEnd}, setFormulario);
    $('#calendar').fullCalendar('refetchEvents');
    if (!modal) {
        $('#CalenderModalNew').modal('toggle');
    }
}





