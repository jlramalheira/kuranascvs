<%--
    Document   : vendasRelatorioPeriodo
    Created on : 06/06/2013, 09:57:27
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Venda"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Venda> vendas = (List<Venda>) request.getAttribute("vendasPeriodo");%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
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
                                    <li class="nav-header">Relatórios</li>
                                    <li><a href="Venda?operacao=VerRelatorioPeriodo">Relatório por período</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Relatório de Vendas por período</h2>
                            <form action="Venda" method="get" class="well">
                                <fieldset>
                                    <legend>Escolha o período</legend>
                                    <div class="row">
                                        <div class="span3">
                                            <label for="periodo-inicio">Inicio</label>
                                            <input type="date" id="periodo-inicio"
                                                   name="periodo-inicio" value="<%=request.getAttribute("dataInicio") != null ? request.getAttribute("dataInicio") : "Nao"%>" />
                                        </div>
                                        <div class="span3">
                                            <label for="periodo-fim">Fim</label>
                                            <input type="date" id="periodo-fim"
                                                   name="periodo-fim" value="<%=request.getAttribute("dataFim") != null ? request.getAttribute("dataFim") : "Nao"%>" />
                                        </div>
                                    </div>
                                </fieldset>
                                <button type="submit" class="btn btn-primary"
                                        name="operacao" value="Relatorio Periodo">
                                    Gerar Relatório
                                </button>
                            </form>
                            <div class="row">
                                <div class="span3">
                                    <h3>Informações</h3>
                                    <p>
                                        <strong>Vendas realizadas: </strong><%=vendas != null ? vendas.size() : 0%><br/>
                                    </p>
                                    <hr/>
                                    <p>
                                        <strong>Ganho total: </strong>R$ <%=request.getAttribute("ganhoTotal")!=null?request.getAttribute("ganhoTotal") : 0%>
                                    </p>
                                </div>
                                <div class="span6">
                                    <div id="chart_div"></div>
                                </div>
                            </div>
                            <%if ((vendas != null) && (!vendas.isEmpty())) {%>
                            <h3>Vendas Realizadas</h3>
                            <table class="table table-hover table-striped table-row-click">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Cliente</th>
                                        <th>Pedido</th>
                                        <th>Entrega</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Venda venda : vendas) {%>
                                    <tr onclick="location = 'Venda?operacao=Ver&idVenda=<%=venda.getId()%>'">
                                        <td><%=venda.getId()%></td>
                                        <td><%=venda.getCliente().getNome()%></td>
                                        <td><%=Util.Util.dateToString(venda.getDataPedido())%></td>
                                        <td><%=venda.getDataEntrega() != null ? Util.Util.dateToString(venda.getDataEntrega()) : "Não Entrege"%></td>
                                        <td>
                                            <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {                                                    %>
                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>
                                            <%} else if (venda.getStatusVenda() == Venda.FINALIZADA) {%>
                                            <span class="btn btn-mini btn-success disabled" title="Finalizada">
                                                <i class="icon-ok icon-white"></i>
                                            </span>
                                            <%} else {%>
                                            <span class="btn btn-mini btn-danger disabled" title="Cancelada">
                                                <i class="icon-remove icon-white"></i>
                                            </span>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div id="push"></div>
        </div>
        <%-- FOOTER --%>
        <%@include file="interfaceFooter.jsp" %>
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
                    ['Cancelada', <%=request.getAttribute("canceladas")%>],
                    ['Finalizada', <%=request.getAttribute("finalizadas")%>],
                    ['Em andamento', <%=request.getAttribute("andamento")%>]
                ]);

                // Set chart options
                var options = {'title':'Status da vendas no período',
                    'width':460,
                    'height':250};

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </body>
</html>
