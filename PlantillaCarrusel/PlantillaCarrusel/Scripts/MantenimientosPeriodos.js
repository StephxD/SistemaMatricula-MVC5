$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaPeriodos",
                dataType: "json"
            }
        },
    });



    $("#kendoGrid").kendoGrid({
        dataSource: origenDatos,
        height: 400,
        width: 1200,
        filterable: true,
        sortable: true,
        navigatable: true,
        columns: [{ field: "id_Periodo", title: "Identificador Periodo" },
            { field: "Codigo", title: "Código Periodo" },
            { field: "Fecha_Inicio", title: "Fecha Inicio", template: "#= kendo.toString(kendo.parseDate(Fecha_Inicio), 'MM/dd/yyyy') #" },
        { field: "Fecha_Fin", title: "Fecha Fin", template: "#= kendo.toString(kendo.parseDate(Fecha_Fin), 'MM/dd/yyyy') #" },
        {
            title: "Acciones", template: '<button class="k-button k-grid-edit" onclick="editPeriodos(#=id_Periodo#)">Editar</button>' +
                '<button class="k-button k-grid-delete" onclick="deletePeriodo(#=id_Periodo#)">Eliminar</button>'
        }],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                    $("#editPeriodosCodigo").val("");
                    $("#datepicker1").val("");
                    $("#datepicker2").val("");

                    $('#dialog-containerINS').show();
                    $("#dialogINS").dialog({
                        dialogClass: "no-close",
                        width: 400,
                        height: 300,
                        modal: true,
                        resizable: true,
                        buttons: {
                            "Insertar registro": function () {
                                //Valor del combo

                                var v1 = $("#insPeriodosCodigo").val();
                                var v2 = $("#datepicker1").val();
                                var v3 = $("#datepicker2").val();
                                $.ajax({
                                    url: "InsertaPeriodos",
                                    type: 'POST',
                                    data: { pCodigo: v1, pFechaInicio: v2, pFechaFin: v3 },
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Periodo agregado!");
                                        $("#kendoGrid").data("kendoGrid").dataSource.read();
                                    },
                                    error: function (jQxhr, textStatus, errorTrown) {
                                        alert("No se puede insertar el registro Compruebe que no se encuentre duplicado.");
                                    }
                                })
                            },
                            "Cerrar": function () {
                                $(this).dialog("close");
                            }
                        },

                    });
                }
            },
            { name: 'excel', Text: 'Excel' },
            { name: 'pdf', Text: 'Pdf' }
        ],
        excel: {
            filename: "ReportePeriodos.xlsx"
        },
        pdf: {
            filename: "ReportePeriodos.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });

    $('#dialog-containerEDT').hide();
    $('#dialog-containerDEL').hide();
    $('#dialog-containerINS').hide();
    $("#datepicker1").datepicker({
        dateFormat: "yy/mm/dd",
        changeYear: true,
        changeMonth: true
    });
    $("#datepicker2").datepicker({
        dateFormat: "yy/mm/dd",
        changeYear: true,
        changeMonth: true

    });
    $("#editPeriodosFechaInicio").datepicker({
        dateFormat: "yy/mm/dd",
        changeYear: true,
        changeMonth: true
    });
    $("#editPeriodosFechaFin").datepicker({
        dateFormat: "yy/mm/dd",
        changeYear: true,
        changeMonth: true

    });
});

// Define the editPeriodo function to show the edit modal
function editPeriodos(id_Periodo) {

    //Make an AJAX call to retrieve the grado data
    $.ajax({
        url: "RetornaPeriodoporID",
        type: "POST",
        data: { id_Periodo: id_Periodo },
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, row) {

                //Guardar en las variables invisibles (las hidden)
                $("#editPeriodoId").val(row.id_Periodo);


                //Mueve el combo a el periodo que la carrera tiene actualmente y no el que se trae por defecto.

                $("#editPeriodosCodigo").val(row.Codigo);
                const date = getDateFromJsonDate(row.Fecha_Inicio);

                $("#editPeriodosFechaInicio").datepicker();
                $("#editPeriodosFechaInicio").datepicker("setDate", date);
                $("#editPeriodosFechaInicio").datepicker("refresh");


                const date1 = getDateFromJsonDate(row.Fecha_Fin);

                $("#editPeriodosFechaFin").datepicker();
                $("#editPeriodosFechaFin").datepicker("setDate", date1);
                $("#editPeriodosFechaFin").datepicker("refresh");


            });
            $('#dialog-containerEDT').show();
            $("#dialogEDT").dialog({
                dialogClass: "no-close",
                width: 400,
                height: 300,
                modal: true,
                resizable: true,
                buttons: {
                    "Actualizar registro": function () {
                        var v1 = $("#editPeriodoId").val();
                        var v2 = $("#editPeriodosCodigo").val();
                        var v3 = $("#editPeriodosFechaInicio").val();
                        var v4 = $("#editPeriodosFechaFin").val();

                        $.ajax({
                            url: "ActualizaPeriodos",
                            type: 'POST',
                            data: { pPeriodoId: v1, pCodigo: v2, pFechaInicio: v3, pFechaFin: v4 },
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Periodo actualizado!");
                                $("#kendoGrid").data("kendoGrid").dataSource.read();
                            },
                            error: function (jQxhr, textStatus, errorTrown) {
                                alert("No es posible actualizar, valide los datos!");
                            }
                        })
                    },
                    "Cerrar": function () {
                        $(this).dialog("close");
                    }
                },

            });
        }
    });
}

// Define the deleteGrado function to show the delete modal
function deletePeriodo(id_Periodo) {
    $("#DeletePeriodoId").val(id_Periodo);

    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 400,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                var v1 = $("#DeletePeriodoId").val();


                $.ajax({
                    url: "EliminaPeriodosPorID",
                    type: 'POST',
                    data: { pid_Periodo: v1 },
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Periodo eliminado!");
                        $("#kendoGrid").data("kendoGrid").dataSource.read();
                    },
                    error: function (jQxhr, textStatus, errorTrown) {
                        alert("No es posible actualizar, valide los datos!");
                    }
                })
            },
            "Cerrar": function () {
                $(this).dialog("close");
            }
        },

    });

}

function getDateFromJsonDate(jsonDate) {
    var timestamp = parseInt(jsonDate.replace(/[^0-9]/g, ""));
    var date = new Date(timestamp);
    var year = date.getFullYear();
    var day = ("0" + date.getDate()).slice(-2);
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var formattedDate = year + "/" + day + "/" + month;
    return formattedDate;
}
