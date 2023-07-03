$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaCarreras",
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
            { field: "id_Carrera", title: "Identificador Carrera" },
            { field: "id_Grado", title: "Identificador Grado" },
            { field: "Nombre", title: "Nombre Carrera" },
            { field: "Descripcion", title: "Descripcion" },
            {
                title: "Acciones",
                template: '<button class="k-button k-grid-edit" onclick="editCarrera(#=id_Carrera#,#=id_Grado#)">Editar</button>' +
                    '<button class="k-button k-grid-delete" onclick="deleteCarrera(#=id_Carrera#,#=id_Grado#)">Eliminar</button>'
            }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                    $("#editCarreraNombre").val("");
                    $("#editCarreraDescripcion").val("");

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
                                var v1 = $('#id_GradoIns').val();
                                var v2 = $("#insCarreraNombre").val();
                                var v3 = $("#insCarreraDescripcion").val();
                                $.ajax({
                                    url: "InsertaCarreras",
                                    type: 'POST',
                                    data: { pGrado: v1, pNombre: v2, pDescripcion: v3 },
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Carrera agregada!");
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
            filename: "ReporteCarreras.xlsx"
        },
        pdf: {
            filename: "ReporteCarreras.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });

    //Llenar el Dropdown de grados del modal Insert
    $.get("../Grados/RetornaGrados",
        function (resultado) {
            $("#id_GradoIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_GradoIns").append("<option value = '" + row.id_Grado + "'>" + row.Nombre + "</option>");
            });
        })

    //Llenar el Dropdown de grados del modal Edit
    $.get("../Grados/RetornaGrados",
        function (resultado) {
            $("#id_GradoEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_GradoEdit").append("<option value = '" + row.id_Grado + "'>" + row.Nombre + "</option>");
            });
        })

    $('#dialog-containerEDT').hide();
    $('#dialog-containerDEL').hide();
    $('#dialog-containerINS').hide();
});

// Define the editGrado function to show the edit modal
function editCarrera(id_Carrera,id_Grado) {

    //Make an AJAX call to retrieve the grado data
    $.ajax({
        url: "RetornaCarrerasPorId",
        type: "POST",
        data: { id_Carrera: id_Carrera,id_Grado: id_Grado },
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, row) {

                //Guardar en las variables invisibles (las hidden)
                $("#editCarreraId").val(row.id_Carrera);

                //$("#editGradoId").val(row.id_Grado);

                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_GradoEdit").val(row.id_Grado);

                $("#editCarreraNombre").val(row.Nombre);

                $("#editCarreraDescripcion").val(row.Descripcion);
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
                        var v1 = $("#editCarreraId").val();
                        var v2 = $("#id_GradoEdit").val();
                        var v3 = $("#editCarreraNombre").val();
                        var v4 = $("#editCarreraDescripcion").val();

                        $.ajax({
                            url: "ActualizaCarreras",
                            type: 'POST',
                            data: { pid_Carrera: v1, pid_Grado: v2, pCarreraNombre: v3, pCarreraDescripcion: v4},
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Carrera actualizado!");
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
function deleteCarrera(id_Carrera, id_Grado) {
    $("#DeleteGradoId").val(id_Grado);
    $("#DeleteCarreraId").val(id_Carrera);

    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 400,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                var v1 = $("#DeleteCarreraId").val();
                var v2 = $("#DeleteGradoId").val();
                
                $.ajax({
                    url: "EliminaCarrerasPorID",
                    type: 'POST',
                    data: { pid_Carrera: v1,pid_Grado: v2 },
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Carrera eliminada!");
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