$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaMaterias",
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
        columns: [
            { field: "id_Materia", title: "Identificador" },
            { field: "Nombre", title: "Nombre de la Materia" },
            { field: "Codigo", title: "Codigo de la Materia" },
            { field: "Cant_Creditos", title: "Cantidad de Creditos" },
            { field: "Cant_Horas", title: "Cantidad de Horas" },
            {
                title: "Acciones",
                template: '<button class="k-button k-grid-edit" onclick="editMateria(#=id_Materia#)">Editar</button>' +
                    '<button class="k-button k-grid-delete" onclick="deleteMateria(#=id_Materia#)">Eliminar</button>'
            }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                 
                    $("#insMateriaNombre").val("");
                    $("#insMateriaCodigo").val("");
                    $("#insCant_CreditosMateria").val("");
                    $("#insCant_HorasMateria").val("");

                    $('#dialog-containerINS').show();
                    $("#dialogINS").dialog({
                        dialogClass: "no-close",
                        width: 500,
                        height: 200,
                        modal: true,
                        resizable: true,
                        buttons: {
                            "Insertar registro": function () {
                                var v1 = $("#insMateriaNombre").val();
                                var v2 = $("#insMateriaCodigo").val();
                                var v3 = $("#insCant_Creditos").val();
                                var v4 = $("#insCant_Horas").val();
                                $.ajax({
                                    url: "InsertaMaterias",
                                    type: 'POST',
                                
                                    data: { pMateriaNombre: v1, pMateriaCodigo: v2, pCant_Creditos: v3, pCant_Horas: v4 },
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Materia agregada!");
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
            },
            { name: 'excel', Text: 'Excel' },
            { name: 'pdf', Text: 'Pdf' }
        ],
        excel: {
            filename: "ReporteMaterias.xlsx"
        },
        pdf: {
            filename: "ReporteMaterias.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });


        $('#dialog-containerEDT').hide();
        $('#dialog-containerDEL').hide();
        $('#dialog-containerINS').hide();
});


// Define the editMateria function to show the edit modal
function editMateria(id_Materia) {

    //Make an AJAX call to retrieve the grado data
    $.ajax({
        url: "RetornaMateriasPorID",
        type: "POST",
        data: { pid_Materia: id_Materia },
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, row) {
                $("#editMateriaId").val(row.id_Materia);
                $("#editMateriaNombre").val(row.Nombre);
                $("#editMateriaCodigo").val(row.Codigo);
                $("#editCant_CreditosMateria").val(row.Cant_Creditos);
                $("#editCant_HorasMateria").val(row.Cant_Horas);
            });
            $('#dialog-containerEDT').show();
            $("#dialogEDT").dialog({
                dialogClass: "no-close",
                width: 500,
                height: 200,
                modal: true,
                resizable: true,
                buttons: {
                    "Actualizar registro": function () {
                        var v1 = $("#editMateriaId").val();
                        var v2 = $("#editMateriaNombre").val();
                        var v3 = $("#editMateriaCodigo").val();
                        var v4 = $("#editCant_CreditosMateria").val();
                        var v5 = $("#editCant_HorasMateria").val();
                        $.ajax({
                            url: "ActualizaMaterias",
                            type: 'POST',
                            data: { pid_Materia: v1, pMateriaNombre: v2, pMateriaCodigo: v3, pCant_Creditos: v4, pCant_Horas: v5 },
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Materia actualizada!");
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

// Define the deleteMateria function to show the delete modal
function deleteMateria(id_Materia) {
    $("#DeleteMateriaId").val(id_Materia);
    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 500,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                var v1 = $("#DeleteMateriaId").val();

                $.ajax({
                    url: "EliminaMateriasPorID",
                    type: 'POST',
                    data: { pid_Materia: v1 },
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Materia eliminada!");
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