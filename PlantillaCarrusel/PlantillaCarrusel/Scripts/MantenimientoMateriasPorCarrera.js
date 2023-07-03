$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaMateriasPorCarrera",
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
            { field: "id_Materia", title: "Identificador Materia" },
          
            {
                title: "Acciones",
                template: '<button class="k-button k-grid-edit" onclick="editMateriaPorCarrera(#=id_Carrera#,#=id_Materia#)">Editar</button>' +
                    '<button class="k-button k-grid-delete" onclick="deleteMateriaPorCarrera(#=id_Carrera#,#=id_Materia#)">Eliminar</button>'
            }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                    $("#id_CarreraEdit").val("");
                    $("#id_MateriaEdit").val("");

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
                                var v1 = $('#id_CarreraIns').val();
                                var v2 = $('#id_MateriaIns').val();
                              
                                $.ajax({
                                    url: "InsertaMateriasPorCarrera",
                                    type: 'POST',
                                    data: { pid_Carrera: v1, pid_Materia: v2 },
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Materia por Carrera agregada!");
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
            filename: "ReporteMateriasPorCarrera.xlsx"
        },
        pdf: {
            filename: "ReporteMateriasPorCarrera.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });

    //Llenar el Dropdown de Carrera del modal Insert
    $.get("../Carreras/RetornaCarreras",
        function (resultado) {
            $("#id_CarreraIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_CarreraIns").append("<option value = '" + row.id_Carrera + "'>" + row.Nombre + "</option>");
            });
        })

    //Llenar el Dropdown de Carrera del modal Edit
    $.get("../Carreras/RetornaCarreras",
        function (resultado) {
            $("#id_CarreraEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_CarreraEdit").append("<option value = '" + row.id_Carrera + "'>" + row.Nombre + "</option>");
            });
        })

    //Llenar el Dropdown de Materias del modal Insert
    $.get("../Materias/RetornaMaterias",
        function (resultado) {
            $("#id_MateriaIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_MateriaIns").append("<option value = '" + row.id_Materia + "'>" + row.Nombre + "</option>");
            });
        })

    //Llenar el Dropdown de Materias del modal Edit
    $.get("../Materias/RetornaMaterias",
        function (resultado) {
            $("#id_MateriaEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_MateriaEdit").append("<option value = '" + row.id_Materia + "'>" + row.Nombre + "</option>");
            });
        })


    $('#dialog-containerEDT').hide();
    $('#dialog-containerDEL').hide();
    $('#dialog-containerINS').hide();
});

// Define the editGrado function to show the edit modal
function editMateriaPorCarrera(id_Carrera, id_Materia) {

    //Make an AJAX call to retrieve the grado data


                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_CarreraEdit").val(id_Carrera);

                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_MateriaEdit").val(id_Materia);


               
         
            $('#dialog-containerEDT').show();
            $("#dialogEDT").dialog({
                dialogClass: "no-close",
                width: 400,
                height: 300,
                modal: true,
                resizable: true,
                buttons: {
                    "Actualizar registro": function () {
                        var v1 = $("#id_CarreraEdit").val();
                        var v2 = $("#id_MateriaEdit").val();
                      
                        $.ajax({
                            url: "ActualizaMateriasPorCarrera",
                            type: 'POST',
                            data: { pid_CarreraOLD: id_Carrera, pid_MateriaOLD: id_Materia, pid_CarreraNEW: v1, pid_MateriaNEW: v2 },
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Materia por Carrera actualizado!");
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
   

// Define the deleteMateriaPorCarrera function to show the delete modal
function deleteMateriaPorCarrera(id_Carrera, id_Materia) {
    //$("#DeleteCarreraId").val(id_Carrera);
    //$("#DeleteMateriaId").val(id_Materia);

    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 400,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                //var v1 = $("#DeleteCarreraId").val();
                //var v2 = $("#DeleteMateriaId").val();

                $.ajax({
                    url: "EliminaMateriasPorCarrerasPorID",
                    type: 'POST',
                    data: { pid_Carrera: id_Carrera, pid_Materia: id_Materia },
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Materia por Carrera eliminada!");
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





