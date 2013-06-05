<%--
    Document   : compraView
    Created on : 31/05/2013, 11:28:59
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Item"%>
<%@page import="Model.Compra"%>
<%@page import="Dao.DaoCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idCompra") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));
        Compra compra = new DaoCompra().get(idCompra);
        if (compra == null) {
            response.sendRedirect("index.jsp");
        } else {
%>
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
                            <h2 class="noMarginTop">Compra #<%=compra.getId()%></h2>
                            <div class="row">
                                <div class="span2">
                                    <strong>Data:</strong> <%=Util.Util.dateToString(compra.getDataPedido())%>
                                </div>
                                <div class="span2">
                                    <strong>Entrega:</strong> <%=compra.getDataEntrega()!= null ? Util.Util.dateToString(compra.getDataEntrega()) : "Não Entrege" %>
                                </div>
                            </div>
                            <strong>Fornecedor:</strong> <%=compra.getFornecedor().getNome()%>
                            <h3>Status da compra</h3>
                            <%if(compra.getStatusCompra() == Compra.ANDAMENTO){ %>
                            <form action="Compra" method="post" class="row">
                                <input type="hidden" name="idCompra" value="<%=compra.getId()%>" />
                                <div class="span3">
                                    <a href="#modalCancelar" role="button" class="btn btn-block btn-danger" data-toggle="modal">Cancelar</a>
                                    <%-- MODAL CANCELAR COMPRA --%>
                                    <div id="modalCancelar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Cancelar compra</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja cancelar a compra?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Cancelar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <a href="#modalFinalizar" role="button" class="btn btn-block btn-success" data-toggle="modal">Finalizar</a>
                                    <%-- MODAL FINALIZAR COMPRA --%>
                                    <div id="modalFinalizar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Finalizar compra</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja finalizar a compra?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Finalizar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%} else if(compra.getStatusCompra() == Compra.FINALIZADA){ %>
                            <p>
                                <span class="btn btn-block btn-success disabled">Compra finalizada</span>
                            </p>
                            <%}else{%>
                            <p>
                                <span class="btn btn-block btn-danger disabled">Compra cancelada</span>
                            </p>
                            <%}%>
                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Itens da compra</h3>
                                </div>
                                <%if (compra.getStatusCompra() == Compra.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar item de compra</a>
                                </div>
                                <%}%>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Valor Unitário</th>
                                        <th>Quantidade</th>
                                        <th>Total</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Item item : compra.getItensCompra()){ %>
                                    <tr>
                                        <td><%=item.getProduto().getNome()%></td>
                                        <td><%=item.getValor()%></td>
                                        <td><%=item.getQuantidade()%></td>
                                        <td><%=item.getValorTotal()%></td>
                                        <%if (compra.getStatusCompra() == Compra.ANDAMENTO) {%>
                                        <td>
                                            <form action="Item" method="post" class="no-margin-bottom">
                                                <input type="hidden" name="idCompra" value="<%=compra.getId()%>" />
                                                <input type="hidden" name="idItem" value="<%=item.getId()%>" />
                                                <button class="btn btn-mini btn-primary" name="operacao" value="Editar Item" formmethod="get" title="Editar item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirItem" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL CANCELAR COMPRA --%>
                                                <div id="modalExcluirItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir item da compra</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o item da compra?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir Item">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                        <%}%>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th><%=compra.getSomaQuantidadeItens()%></th>
                                        <th><%=compra.getSomaValoresItens()%></th>
                                    </tr>
                                </tfoot>
                            </table>
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
<%}
    }%>