<%--
    Document   : vendasRelatorioPeriodo
    Created on : 06/06/2013, 09:57:27
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1.0', {'packages':['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Status');
                data.addColumn('number', 'Quantidade');
                data.addRows([
                    ['Cancelada', 3],
                    ['Finalizada', 1],
                    ['Em andamento', 1]
                ]);

                // Set chart options
                var options = {'title':'Status da vendas no período',
                    'width':400,
                    'height':300};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div class="nonFooter">
            <%-- HEADER --%>
            <%@include file="interfaceHeader.jsp" %>
            <div id="main">
                <div class="container">
                    <div class="row">
                        <div class="span3">
                            <div class="well sidebar-nav">
                                <ul class="nav nav-list">
                                    <li class="nav-header">Vendas</li>
                                    <li><a href="Venda?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Venda?operacao=Novo">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Relatório de Vendas por Período</h2>
                            <form action="" method="get" class="well">
                                <fieldset>
                                    <legend>Escolha o período</legend>
                                    <div class="row">
                                        <div class="span3">
                                            <label for="periodo-inicio">Inicio</label>
                                            <input type="date" id="periodo-inicio"
                                                   name="periodo-inicio"/>
                                        </div>
                                        <div class="span3">
                                            <label for="periodo-fim">Fim</label>
                                            <input type="date" id="periodo-fim"
                                                   name="periodo-fim"/>
                                        </div>
                                    </div>
                                </fieldset>
                                <button type="submit" class="btn btn-primary"
                                        name="operacao" value="relatorio-periodo">
                                    Gerar Relatório
                                </button>
                            </form>
                            <div class="row">
                                <div class="span3">

                                </div>
                                <div class="span6">
                                    <div id="chart_div"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="push"></div>
        </div>
        <%-- FOOTER --%>
        <%@include file="interfaceFooter.jsp" %>
    </body>
</html>
