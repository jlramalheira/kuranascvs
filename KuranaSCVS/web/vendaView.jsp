<%--
    Document   : vendaView
    Created on : 01/06/2013, 15:55:38
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Item"%>
<%@page import="Model.Venda"%>
<%@page import="Dao.DaoVenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idVenda") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idVenda = Integer.parseInt(request.getParameter("idVenda"));
        Venda venda = new DaoVenda().get(idVenda);
        if (venda == null) {
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
                                    <li class="nav-header">Vendas</li>
                                    <li><a href="Venda?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Venda?operacao=Novo">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Venda #<%=venda.getId()%></h2>
                            <div class="row">
                                <div class="span2">
                                    <strong>Data:</strong> <%=Util.Util.dateToString(venda.getDataPedido())%>
                                </div>
                                <div class="span2">
                                    <strong>Entrega:</strong> <%=venda.getDataEntrega() != null ? Util.Util.dateToString(venda.getDataEntrega()) : "Não Entrege"%>
                                </div>
                            </div>
                            <strong>Cliente:</strong> <%=venda.getCliente().getNome()%>
                            <h3>Status da venda</h3>
                            <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {%>
                            <form action="Venda" method="post" class="row">
                                <input type="hidden" name="idVenda" value="<%=venda.getId()%>" />
                                <div class="span3">
                                    <a href="#modalCancelar" role="button" class="btn btn-block btn-danger" data-toggle="modal">Cancelar</a>
                                    <%-- MODAL CANCELAR VENDA --%>
                                    <div id="modalCancelar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Cancelar venda</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja cancelar a venda?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Cancelar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <a href="#modalFinalizar" role="button" class="btn btn-block btn-success" data-toggle="modal">Finalizar</a>
                                    <%-- MODAL FINALIZAR VENDA --%>
                                    <div id="modalFinalizar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Finalizar venda</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja finalizar a venda?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Finalizar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%} else if (venda.getStatusVenda() == Venda.FINALIZADA) {%>
                            <p>
                                <span class="btn btn-block btn-success disabled">Venda finalizada</span>
                            </p>
                            <%} else {%>
                            <p>
                                <span class="btn btn-block btn-danger disabled">Venda cancelada</span>
                            </p>
                            <%}%>
                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Serviços</h3>
                                </div>
                                <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar serviço</a>
                                </div>
                                <%}%>
                            </div>

                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Itens da venda</h3>
                                </div>
                                <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar item de venda</a>
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
                                    <%for (Item item : venda.getItensVenda()) {
                                            if (item.getProduto() != null) {%>
                                    <tr>
                                        <td><%=item.getProduto().getNome()%></td>
                                        <td><%=item.getValor()%></td>
                                        <td><%=item.getQuantidade()%></td>
                                        <td>R$ <%=item.getValorTotal()%></td>
                                        <td>
                                            <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {%>
                                            <form action="ItemVenda" method="post" class="no-margin-bottom">
                                                <input type="hidden" name="idVenda" value="<%=venda.getId()%>" />
                                                <input type="hidden" name="idItem" value="<%=item.getId()%>" />
                                                <button type="submit" class="btn btn-mini btn-primary" formaction="ItemVenda" formmethod="GET" name="operacao" value="Editar" title="Editar Item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirItem" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA VENDA --%>
                                                <div id="modalExcluirItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir item da venda</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o item da venda?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <%} else if (item.getServico() != null) {%>
                                    <tr>
                                        <td><%=item.getServico().getNome()%></td>
                                        <td><%=item.getValor()%></td>
                                        <td><%=item.getQuantidade()%></td>
                                        <td>R$ <%=item.getValorTotal()%></td>
                                        <td>
                                            <%if (venda.getStatusVenda() == Venda.ANDAMENTO) {%>
                                            <form action="ItemServico" method="post" class="no-margin-bottom">
                                                <input type="hidden" name="idVenda" value="<%=venda.getId()%>" />
                                                <input type="hidden" name="idItem" value="<%=item.getId()%>" />
                                                <button type="submit" class="btn btn-mini btn-primary" formaction="ItemServico" formmethod="GET" name="operacao" value="Editar" title="Editar Item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirItem" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA VENDA --%>
                                                <div id="modalExcluirItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir item da venda</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o item da venda?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th><%=venda.getSomaQuantidadeItensVenda()%></th>
                                        <th>R$ <%=venda.getSomaValoresItensVenda()%></th>
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