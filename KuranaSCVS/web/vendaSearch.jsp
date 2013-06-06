<%--
    Document   : vendaSearch
    Created on : 06/06/2013, 08:33:37
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Venda"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Venda> vendas = (List<Venda>) request.getAttribute("vendas"); %>
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
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Controle de Vendas</h2>
                            <form action="Venda" method="GET" class="well">
                                <fieldset>
                                    <label for="cliente">Cliente</label>
                                    <input type="text" id="cliente" class="input-xxlarge"
                                           name="cliente" value=""
                                           placeholder="Insira o nome do cliente"/>
                                    <div class="more-options hide">
                                        <label><strong>Data do Pedido</strong></label>
                                        <div class="row">
                                            <div class="span3">
                                                <label for="pedido-inicio">Inicio</label>
                                                <input type="date" id="pedido-inicio"
                                                       name="pedido-inicio"/>
                                            </div>
                                            <div class="span3">
                                                <label for="pedido-fim">Fim</label>
                                                <input type="date" id="pedido-fim"
                                                       name="pedido-fim"/>
                                            </div>
                                        </div>
                                        <label><strong>Data de Entrega</strong></label>
                                        <div class="row">
                                            <div class="span3">
                                                <label for="entrega-inicio">Inicio</label>
                                                <input type="date" id="entrega-inicio"
                                                       name="entrega-inicio"/>
                                            </div>
                                            <div class="span3">
                                                <label for="entrega-fim">Fim</label>
                                                <input type="date" id="entrega-fim"
                                                       name="entrega-fim"/>
                                            </div>
                                        </div>
                                        <label class="radio">
                                            <input type="radio" name="status" value="0"/>
                                            Em andamento
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="status" value="1"/>
                                            Finalizada
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="status" value="2"/>
                                            Cancelada
                                        </label>
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if ((vendas != null) && (!vendas.isEmpty())){ %>
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
                                    <%for(Venda venda : vendas){ %>
                                    <tr onclick="location = 'Venda?operacao=Ver&idVenda=<%=venda.getId()%>'">
                                        <td><%=venda.getId()%></td>
                                        <td><%=venda.getCliente().getNome()%></td>
                                        <td><%=Util.Util.dateToString(venda.getDataPedido())%></td>
                                        <td><%=venda.getDataEntrega() != null ? Util.Util.dateToString(venda.getDataEntrega()) : "Não Entrege"%></td>
                                        <td>
                                            <%if (venda.getStatusVenda() == Venda.ANDAMENTO){ %>
                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>
                                            <%} else if(venda.getStatusVenda() == Venda.FINALIZADA) {%>
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
    </body>
</html>