$(document).ready(function () {
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: "RetornaMatricula",
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
            { field: "id_Matricula", title: "Identificador Matricula" },
            { field: "id_Materia", title: "Identificador Materia" },
            { field: "id_Alumno", title: "Identificador Alumno" },
            { field: "Nota", title: "Nota" },
            { field: "id_Periodo", title: "Identificador Periodo" },
            {
                title: "Acciones",
                template: '<button class="k-button k-grid-edit" onclick="editMatricula(#=id_Matricula#,#=id_Materia#,#=id_Alumno#,#=id_Periodo#)">Editar</button>' +
                    '<button class="k-button k-grid-delete" onclick="deleteMatricula(#=id_Matricula#,#=id_Materia#,#=id_Alumno#,#=id_Periodo#)">Eliminar</button>'
            }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox
                
                    $("#editNota").val("");

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
                                var v1 = $('#id_MateriaIns').val();
                                var v2 = $('#id_AlumnoIns').val();
                                var v3 = $('#InsNota').val();
                                var v4 = $('#id_PeriodoIns').val();
                               
                                $.ajax({
                                    url: "InsertaMatricula",
                                    type: 'POST',
                                    data: { pid_Materia: v1, pid_Alumno: v2, pNota: v3, pid_Periodo: v4 },
                                    success: function () {
                                        $("#dialogINS").dialog("close");
                                        alert("Matricula agregada!");
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
            filename: "ReporteMatricula.xlsx"
        },
        pdf: {
            filename: "ReporteMatricula.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });

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

    //Llenar el Dropdown de Alumno del modal Insert
    $.get("../Alumno/RetornaAlumno",
        function (resultado) {
            $("#id_AlumnoIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_AlumnoIns").append("<option value = '" + row.id_Alumno + "'>" + row.Nombre + " " + row.Apellido1 + " " + row.Apellido2 + "</option>");
            });
        })

    //Llenar el Dropdown de Alumno del modal Edit
    $.get("../Alumno/RetornaAlumno",
        function (resultado) {
            $("#id_AlumnoEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_AlumnoEdit").append("<option value = '" + row.id_Alumno + "'>" + row.Nombre + " " + row.Apellido1 + " " + row.Apellido2+"</option>");
            });
        })

    //Llenar el Dropdown de Periodos del modal Insert
    $.get("../Periodos/RetornaPeriodos",
        function (resultado) {
            $("#id_PeriodoIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_PeriodoIns").append("<option value = '" + row.id_Periodo + "'>" + row.Codigo + "</option>");
            });
        })

    //Llenar el Dropdown de Periodos del modal Edit
    $.get("../Periodos/RetornaPeriodos",
        function (resultado) {
            $("#id_PeriodoEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_PeriodoEdit").append("<option value = '" + row.id_Periodo + "'>" + row.Codigo + "</option>");
            });
        })

    $('#dialog-containerEDT').hide();
    $('#dialog-containerDEL').hide();
    $('#dialog-containerINS').hide();
});

// Define the editMatricula function to show the edit modal
function editMatricula(id_Matricula,id_Alumno, ) {

    //Make an AJAX call to retrieve the grado data
    $.ajax({
        url: "RetornaMatriculaporAlumno",
        type: "POST",
        data: { pid_Matricula: id_Matricula, pid_Alumno: id_Alumno },
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, row) {

                //Guardar en las variables invisibles (las hidden)
                $("#editMatriculaId").val(row.id_Matricula);

                //$("#editGradoId").val(row.id_Grado);

                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_MateriaEdit").val(row.id_Materia);

                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_AlumnoEdit").val(row.id_Alumno);

                $("#editNota").val(row.Nota);

                //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                $("#id_PeriodoEdit").val(row.id_Periodo);

               

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
                        var v1 = $("#editMatriculaId").val();
                        var v2 = $("#id_MateriaEdit").val();
                        var v3 = $("#id_AlumnoEdit").val();
                        var v4 = $("#editNota").val();
                        var v5 = $("#id_PeriodoEdit").val();

                        $.ajax({
                            url: "ActualizaMatricula",
                            type: 'POST',
                            data: { pid_Matricula: v1, pid_Materia: v2, pid_Alumno: v3, pNota: v4, pid_Periodo: v5 },
                            success: function () {
                                $("#dialogEDT").dialog("close");
                                alert("Matricula actualizado!");
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
function deleteMatricula(id_Matricula) {
    $("#DeleteMatriculaId").val(id_Matricula);
  

    $('#dialog-containerDEL').show();
    $("#dialogDEL").dialog({
        dialogClass: "no-close",
        width: 400,
        height: 125,
        modal: true,
        resizable: true,
        buttons: {
            "Eliminar registro": function () {
                var v1 = $("#DeleteMatriculaId").val();
            

                $.ajax({
                    url: "EliminaMatricula",
                    type: 'POST',
                    data: { pid_Matricula: v1},
                    success: function () {
                        $("#dialogDEL").dialog("close");
                        alert("Matricula eliminada!");
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