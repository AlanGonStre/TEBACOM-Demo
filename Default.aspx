<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo Tablero Académico - TEBACOM</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">

        var datosGenero = <%= DatosGeneroJson %>;
        var datosLengua = <%= DatosLenguaJson %>;
        var datosAvance = <%= DatosAvanceJson %>;

        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            drawGenero();
            drawLengua();
            drawAvance();
        }

        function drawGenero() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Género');
            data.addColumn('number', 'Total');

            for (var i = 0; i < datosGenero.length; i++) {
                data.addRow([datosGenero[i].Genero, datosGenero[i].Total]);
            }

            var options = {
                title: 'Distribución por Género',
                pieHole: 0.4
            };

            var chart = new google.visualization.PieChart(document.getElementById('chartGenero'));
            chart.draw(data, options);
        }

        function drawLengua() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Lengua');
            data.addColumn('number', 'Total');

            for (var i = 0; i < datosLengua.length; i++) {
                data.addRow([datosLengua[i].Lengua, datosLengua[i].Total]);
            }

            var options = {
                title: 'Registro de Lenguas Indígenas'
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chartLengua'));
            chart.draw(data, options);
        }

        function drawAvance() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Grado-Parcial');
            data.addColumn('number', '% Avance');

            for (var i = 0; i < datosAvance.length; i++) {
                var label = 'Grado ' + datosAvance[i].Grado + ' - P' + datosAvance[i].Parcial;
                data.addRow([label, datosAvance[i].Porcentaje]);
            }

            var options = {
                title: 'Avance de captura de calificaciones',
                vAxis: { minValue: 0, maxValue: 100 },
                legend: 'none'
            };

            var chart = new google.visualization.BarChart(document.getElementById('chartAvance'));
            chart.draw(data, options);
        }
    </script>

    <style>
        body { font-family: Arial; margin: 20px; }
        .chart-container { margin-bottom: 40px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Tablero Académico - TEBACOM</h1>
        <p>Datos de ejemplo sin conexión a la base de datos institucional.</p>

        <div class="chart-container" id="chartGenero" style="width: 900px; height: 400px;"></div>
        <div class="chart-container" id="chartLengua" style="width: 900px; height: 400px;"></div>
        <div class="chart-container" id="chartAvance" style="width: 900px; height: 400px;"></div>
    </form>
</body>
</html>
