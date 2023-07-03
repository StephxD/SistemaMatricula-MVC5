$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaGrados",
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
                { field: "id_Grado", title: "Identificador" },
                { field: "Nombre", title: "Nombre del grado" },
                { field: "Descripcion", title: "Descripcion" },
                {
                    title: "Acciones",
                    template: '<button class="k-button k-grid-edit" onclick="editGrado(#=id_Grado#)">Editar</button>' +
                        '<button class="k-button k-grid-delete" onclick="deleteGrado(#=id_Grado#)">Eliminar</button>'
                }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                    $("#insGradoNombre").val("");
                    $("#insGradoDescripcion").val("");

                    $('#dialog-containerINS').show();
                    $("#dialogINS").dialog({
                        dialogClass: "no-close",
                        width: 400,
                        height: 200,
                        modal: true,
                        resizable: true,
                        buttons: {
                            "Insertar registro": function () {
                                var v1 = $("#insGradoNombre").val();
                                var v2 = $("#insGradoDescripcion").val();
                                $.ajax({
                                    url: "InsertaGrado",
                                    type: 'POST',
                                    data: { pNombre: v1, pDescripcion: v2},
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Grado agregado!");
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
            filename: "ReporteGrados.xlsx"
        },
        pdf: {
            filename: "ReporteGrados.pdf",
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

// Define the editGrado function to show the edit modal
function editGrado(id_Grado) {
   
     //Make an AJAX call to retrieve the grado data
    $.ajax({
        url: "RetornaGradosPorId",
        type: "POST",
        data: { id_Grado: id_Grado },
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, row) {
                $("#editGradoId").val(row.id_Grado);
                $("#editGradoNombre").val(row.Nombre);
                $("#editGradoDescripcion").val(row.Descripcion);
            });
            $('#dialog-containerEDT').show();
            $("#dialogEDT").dialog({
                dialogClass: "no-close",
                width: 400,
                height: 200,
                modal: true,
                resizable: true,
                buttons: {
                    "Actualizar registro": function () {
                        var v1 = $("#editGradoId").val();
                        var v2 = $("#editGradoNombre").val();
                        var v3 = $("#editGradoDescripcion").val();

                        $.ajax({
                            url: "ActualizaGrados",
                            type: 'POST',
                            data: { pid_Grado: v1, pGradoNombre: v2, pGradoDescripcion: v3 },
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Grado actualizado!");
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
function deleteGrado(id_Grado) {
    $("#DeleteGradoId").val(id_Grado);
    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 400,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                var v1 = $("#DeleteGradoId").val();

                $.ajax({
                    url: "EliminaGradosPorID",
                    type: 'POST',
                    data: { pid_Grado: v1 },
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Grado eliminado!");
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