$(document).ready(function () {
    var permissionValue = $("#permissionValue").val();
    var idusr = $("#idusr").val();

    var urlneeded = "";

    if (permissionValue == '1') {
        urlneeded = "ReporteMatriculaGen";
    }
    else {
        urlneeded = "ReporteMatriculaPorEstudiante";
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
            { field: "id_Matricula", title: "Identificador Matricula" },
            { field: "Materia", title: "Materia"},
            { field: "Codigo", title: "Codigo" },
            { field: "NombreEst", title: "Nombre Estudiante" },
            { field: "Nota", title: "Nota" },
            { field: "Estado", title: "Estado" }
        ],
        toolbar: [
            { name: 'excel', Text: 'Excel' },
            { name: 'pdf', Text: 'Pdf' }
        ],
        excel: {
            filename: "ReporteMateriasPorAlumno.xlsx"
        },
        pdf: {
            filename: "ReporteMateriasPorAlumno.pdf",
            allPages: true,
            landscape: true,
            paperSize: "A4",
            repeatHeaders: true
        }
    });
})