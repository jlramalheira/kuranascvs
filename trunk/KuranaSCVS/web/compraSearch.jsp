<%--
    Document   : compraSearch
    Created on : 31/05/2013, 15:15:32
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Compra"%>
<%@page import="Dao.DaoFornecedor"%>
<%@page import="java.util.List"%>
<%@page import="Model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Fornecedor> fornecedores = new DaoFornecedor().list();
List<Compra> compras = (List<Compra>) session.getAttribute("compras"); %>
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
                                    <li class="nav-header">Compras</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2>Controle de compras</h2>
                            <form class="well" method="get" action="Compra">
                                <fieldset>
                                    <label for="fornecedor">Fornecedor</label>
                                    <select name="fornecedor" class="input-xlarge">
                                        <option value="0">Escolha um Fornecedor</option>
                                        <%for (Fornecedor fornecedor : fornecedores){ %>
                                            <option value="<%=fornecedor.getId()%>"><%=fornecedor.getNome()%></option>
                                        <%}%>
                                    </select>
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
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-large btn-primary">Pesquisar</button>
                                <button type="button" class="btn btn-large" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if((compras!=null) && (!compras.isEmpty())){ %>        
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Fornecedor</th>
                                        <th>Pedido</th>
                                        <th>Entrega</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Compra compra : compras){ %>
                                    <tr>
                                        <td><%=compra.getId()%></td>
                                        <td><%=compra.getFornecedor().getNome()%></td>
                                        <td><%=Util.Util.dateToString(compra.getDataPedido())%></td>
                                        <td><%=compra.getDataEntrega()!= null ? Util.Util.dateToString(compra.getDataEntrega()) : "Não Entrege" %></td>
                                        <td>
                                            <%if(compra.getStatusCompra() == Compra.ANDAMENTO){ %>
                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>
                                            <%} else if(compra.getStatusCompra() == Compra.FINALIZADA){ %>
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
