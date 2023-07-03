$(document).ready(function () {
    var permissionValue = $("#permissionValue").val();
    var idusr = $("#idusr").val();

    var urlneeded = "";

    if (permissionValue == '1') {
        urlneeded = "RetornaAlumno";
    }
    else {
        urlneeded = "RetornaAlumnoData";
    }
    var origenDatos = new kendo.data.DataSource({
        transport: {
            read: {
                url: urlneeded,
                dataType: "json",
                data: { pLogin: idusr },
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
            { field: "id_Alumno", title: "Identificador Alumno" },
            { field: "Fecha_Ingreso", title: "Fecha de Ingreso", template: "#= kendo.toString(kendo.parseDate(Fecha_Ingreso), 'MM/dd/yyyy') #" },
            { field: "Cedula", title: "Cedula" },
            { field: "Genero", title: "Genero" },
            { field: "Fecha_Nacimiento", title: "Fecha de Nacimiento", template: "#= kendo.toString(kendo.parseDate(Fecha_Nacimiento), 'MM/dd/yyyy') #" },
            { field: "Nombre", title: "Nombre" },
            { field: "Apellido1", title: "Primer Apellido" },
            { field: "Apellido2", title: "Segundo Apellido" },
            { field: "Direccion", title: "Direccion" },
            { field: "Telefono1", title: "Telefono Principal" },
            { field: "Telefono2", title: "Telefono Secundario" },
            { field: "Correo", title: "Correo" },
            { field: "id_Provincia", title: "Provincia" },
            { field: "id_Canton", title: "Canton" },
            { field: "id_Distrito", title: "Distrito" },

            {
                title: "Acciones",
                template: '<button class="k-button k-grid-edit" onclick="editAlumno(#=id_Alumno#)">Editar</button>' +
                    '<button class="k-button k-grid-delete" onclick="deleteAlumno(#=id_Alumno#)">Eliminar</button>'
            }
        ],
        toolbar: [
            {
                name: 'addrecord',
                text: 'Agregar un registo',
                click: function () {
                    //Limpia los textbox

                    if (permissionValue == '1') {
                        $('#dialog-containerINS').show();
                        $("#dialogINS").dialog({
                            dialogClass: "no-close",
                            width: 600,
                            height: 300,
                            modal: true,
                            resizable: true,
                            buttons: {
                                "Insertar registro": function () {
                                    var v1 = $('#InsAlumnoFecha_Ingreso').val();
                                    var v2 = $('#InsAlumnoCedula').val();
                                    var v3 = $('#InsAlumnoGenero').val();
                                    var v4 = $('#InsAlumnoFecha_Nacimiento').val();
                                    var v5 = $('#InsAlumnoNombre').val();
                                    var v6 = $('#InsAlumnoApellido1').val();
                                    var v7 = $('#InsAlumnoApellido2').val();
                                    var v8 = $('#InsAlumnoDireccion').val();
                                    var v9 = $('#InsAlumnoTelefono1').val();
                                    var v10 = $('#InsAlumnoTelefono2').val();
                                    var v11 = $('#InsAlumnoCorreo').val();
                                    var v12 = $('#id_ProvinciaIns').val();
                                    var v13 = $('#id_CantonIns').val();
                                    var v14 = $('#id_DistritoIns').val();

                                    var Ingreso = v1.replace(/\//g, "-");
                                    var Nacimiento = v4.replace(/\//g, "-");

                                    console.log(Ingreso);
                                    console.log(Nacimiento);

                                    $.ajax({
                                        url: "InsertaAlumno",
                                        type: 'POST',
                                        data: { pFecha_Ingreso: Ingreso, pCedula: v2, pGenero: v3, pFecha_Nacimiento: Nacimiento, pNombre: v5, pApellido1: v6, pApellido2: v7, pDireccion: v8, pTelefono1: v9, pTelefono2: v10, pCorreo: v11, pid_Provincia: v12, pid_Canton: v13, pid_Distrito: v14 },
                                        success: function () {
                                            $("#dialogINS").dialog("close");
                                            alert("Alumno Insertado!");
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
                    else
                    {
                        alert("No esta autorizado para esta accion");
                    }
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

    $('#dialog-containerEDT').hide();
    $('#dialog-containerDEL').hide();
    $('#dialog-containerINS').hide();



    //Llenar el Dropdown de Provincia del modal Insert al iniciar
    $.get("../Alumno/RetornaProvincias",
        function (resultado) {
            $("#id_ProvinciaIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_ProvinciaIns").append("<option value = '" + row.id_Provincia + "'>" + row.nombre + "</option>");
            });
            onid_ProvinciaInsChange();

        });

    //Llenar el Dropdown de Provincia del modal Edit al iniciar
    $.get("../Alumno/RetornaProvincias",
        function (resultado) {
            $("#id_ProvinciaEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_ProvinciaEdit").append("<option value = '" + row.id_Provincia + "'>" + row.nombre + "</option>");
            });
            onid_ProvinciaEditChange();
        });


    $("#InsAlumnoFecha_Ingreso").datepicker({
        dateFormat: "yy/mm/dd",
    });
    $("#InsAlumnoFecha_Nacimiento").datepicker({
        dateFormat: "yy/mm/dd",
    });

    $("#editAlumnoFecha_Ingreso").datepicker({
        dateFormat: "yy/mm/dd",
    });

    $("#editAlumnoFecha_Nacimiento").datepicker({
        dateFormat: "yy/mm/dd",
    });


    $("#id_ProvinciaIns").on("change", onid_ProvinciaInsChange);
    $("#id_ProvinciaEdit").on("change", onid_ProvinciaEditChange);
    $("#id_CantonIns").on("change", onid_CantonInsChange);
    $("#id_CantonEdit").on("change", onid_CantonEditChange);

});

//Llenar el combo de Canton del modal Insert al cambiar el valor de la provincia
function onid_ProvinciaInsChange() {
    var id_ProvinciaINS = $('#id_ProvinciaIns').val();
    $.get("RetornaCantonPorProvincia?pid_Provincia=" + id_ProvinciaINS,
        function (resultado) {
            $("#id_CantonIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_CantonIns").append("<option value = '" + row.id_Canton + "'>" + row.nombre + "</option>");
            });
            onid_CantonInsChange();
        })
}


//Llenar el combo de Canton del modal Edit al cambiar el valor de la provincia
function onid_ProvinciaEditChange() {
    var id_ProvinciaEdit = $('#id_ProvinciaEdit').val();
    $.get("RetornaCantonPorProvincia?pid_Provincia=" + id_ProvinciaEdit,
        function (resultado) {
            $("#id_CantonEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_CantonEdit").append("<option value = '" + row.id_Canton + "'>" + row.nombre + "</option>");
            });
            onid_CantonEditChange();
        })
}

//Llenar el combo de Distrito del modal Insert al cambiar el valor de la provincia
function onid_CantonInsChange() {
    var id_CantonINS = $('#id_CantonIns').val();
    $.get("RetornaDistritoPorCanton?pid_Canton=" + id_CantonINS,
        function (resultado) {
            $("#id_DistritoIns").empty();
            $.each(resultado, function (index, row) {
                $("#id_DistritoIns").append("<option value = '" + row.id_Distrito + "'>" + row.nombre + "</option>");
            });
        })
}


//Llenar el combo de Distrito del modal Edit al cambiar el valor de la provincia
function onid_CantonEditChange() {
    var id_CantonEdit = $('#id_CantonEdit').val();
    $.get("RetornaDistritoPorCanton?pid_Canton=" + id_CantonEdit,
        function (resultado) {
            $("#id_DistritoEdit").empty();
            $.each(resultado, function (index, row) {
                $("#id_DistritoEdit").append("<option value = '" + row.id_Distrito + "'>" + row.nombre + "</option>");
            });
        })
}


// Define the editGrado function to show the edit modal
function editAlumno(id_Alumno) {
    var permissionValue = $("#permissionValue").val();
    if (permissionValue == '1') {
        //Make an AJAX call to retrieve the grado data
        $.ajax({
            url: "RetornaAlumnoPorID",
            type: "POST",
            data: { pid_Alumno: id_Alumno },
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, row) {

                    //Guardar en las variables invisibles (las hidden)
                    $("#editAlumnoId").val(id_Alumno);

                    //Mueve el combo a el grado que la carrera tiene actualmente y no el que se trae por defecto.
                    console.log(row.Fecha_Ingreso);

                    const date1 = getDateFromJsonDate(row.Fecha_Ingreso);
                    $('#editAlumnoFecha_Ingreso').val(date1);

                    $('#editAlumnoCedula').val(row.Cedula);
                    $('#editAlumnoGenero').val(row.Genero);

                    const date2 = getDateFromJsonDate(row.Fecha_Nacimiento);
                    $('#editAlumnoFecha_Nacimiento').val(date2);

                    $('#editAlumnoNombre').val(row.Nombre);
                    $('#editAlumnoApellido1').val(row.Apellido1);
                    $('#editAlumnoApellido2').val(row.Apellido2);
                    $('#editAlumnoDireccion').val(row.Direccion);
                    $('#editAlumnoTelefono1').val(row.Telefono1);
                    $('#editAlumnoTelefono2').val(row.Telefono2);
                    $('#editAlumnoCorreo').val(row.Correo);
                    $('#id_ProvinciaEdit').val(row.id_Provincia);
                    $('#id_CantonEdit').val(row.id_Canton);
                    $('#id_DistritoEdit').val(row.id_Distrito);
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
                            var v1 = $('#editAlumnoFecha_Ingreso').val();
                            var v2 = $('#editAlumnoCedula').val();
                            var v3 = $('#editAlumnoGenero').val();
                            var v4 = $('#editAlumnoFecha_Nacimiento').val();
                            var v5 = $('#editAlumnoNombre').val();
                            var v6 = $('#editAlumnoApellido1').val();
                            var v7 = $('#editAlumnoApellido2').val();
                            var v8 = $('#editAlumnoDireccion').val();
                            var v9 = $('#editAlumnoTelefono1').val();
                            var v10 = $('#editAlumnoTelefono2').val();
                            var v11 = $('#editAlumnoCorreo').val();
                            var v12 = $('#id_ProvinciaEdit').val();
                            var v13 = $('#id_CantonEdit').val();
                            var v14 = $('#id_DistritoEdit').val();
                            var v15 = id_Alumno;

                            var Ingreso = v1.replace(/\//g, "-");
                            var Nacimiento = v4.replace(/\//g, "-");


                            $.ajax({
                                url: "ActualizaAlumno",
                                type: 'POST',
                                data: { pFecha_Ingreso: Ingreso, pCedula: v2, pGenero: v3, pFecha_Nacimiento: Nacimiento, pNombre: v5, pApellido1: v6, pApellido2: v7, pDireccion: v8, pTelefono1: v9, pTelefono2: v10, pCorreo: v11, pid_Provincia: v12, pid_Canton: v13, pid_Distrito: v14, pid_Alumno: v15 },
                                success: function () {
                                    $("#dialogEDT").dialog("close");
                                    alert("Alumno actualizado!");
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
    else {
        alert("No esta autorizado para esta accion");
    }
}

// Define the deleteGrado function to show the delete modal
function deleteAlumno(id_Alumno) {
    var permissionValue = $("#permissionValue").val();
    if (permissionValue == '1') {
        $("#DeleteAlumnoId").val(id_Alumno);

        $('#dialog-containerDEL').show();
        $("#dialogDEL").dialog({
            dialogClass: "no-close",
            width: 400,
            height: 125,
            modal: true,
            resizable: true,
            buttons: {
                "Eliminar registro": function () {
                    var v1 = $("#DeleteAlumnoId").val();

                    $.ajax({
                        url: "EliminaAlumnoPorID",
                        type: 'POST',
                        data: { pid_Alumno: v1 },
                        success: function () {
                            $("#dialogDEL").dialog("close");
                            alert("Alumno eliminado!");
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
    else
        {
            alert("No esta autorizado para esta accion");
        }
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