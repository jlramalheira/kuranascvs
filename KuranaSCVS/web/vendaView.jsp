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
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Venda #<%=venda.getId()%></h2>
                            <div class="row">
                                <div class="span2">
                                    <strong>Data:</strong> <%=venda.getDataPedido()%>
                                </div>
                                <div class="span2">
                                    <strong>Entrega:</strong> <%=venda.getDataEntrega()!= null ? Util.Util.dateToString(venda.getDataEntrega()) : "Não Entrege" %>
                                </div>
                            </div>
                            <strong>Cliente:</strong> <%=venda.getCliente().getNome()%>
                            <h3>Status da venda</h3>
                            <%if(venda.getStatusVenda() == Venda.ANDAMENTO){ %>
                            <form action="" method="post" class="row">
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
                                            <button type="submit" class="btn btn-primary" name="operacao" value="cancelar">Sim</button>
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
                                            <button type="submit" class="btn btn-primary" name="operacao" value="finalizar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%}else if (venda.getStatusVenda() == Venda.FINALIZADA){ %>
                            <p>
                                <span class="btn btn-block btn-success disabled">Venda finalizada</span>
                            </p>
                            <%}else{%>
                            <p>
                                <span class="btn btn-block btn-danger disabled">Venda cancelada</span>
                            </p>
                            <%}%>
                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Serviços</h3>
                                </div>
                                <%if(venda.getStatusVenda() == Venda.ANDAMENTO){ %>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar serviço</a>
                                </div>
                                <%}%>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Serviço</th>
                                        <th>Valor Unitário</th>
                                        <th>Quantidade</th>
                                        <th>Total</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Item item : venda.getItensServico()){ %>
                                    <tr>
                                        <td>Nome do serviço</td>
                                        <td>R$ 10,00</td>
                                        <td>200</td>
                                        <td>R$ 2000,00</td>
                                        <td>
                                            <form action="" method="post" class="no-margin-bottom">
                                                <button class="btn btn-mini btn-primary" name="editar-item" value="Id" title="Editar item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirServico" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA VENDA --%>
                                                <div id="modalExcluirServico" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir serviço da venda</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o serviço da venda?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="excuir-item" value="Id">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th>600</th>
                                        <th>R$ 6000,00</th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Itens da venda</h3>
                                </div>
                                <%if(venda.getStatusVenda() == Venda.ANDAMENTO){ %>
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
                                    <tr>
                                        <td>Nome do produto</td>
                                        <td>R$ 10,00</td>
                                        <td>200</td>
                                        <td>R$ 2000,00</td>
                                        <td>
                                            <form action="" method="post" class="no-margin-bottom">
                                                <button class="btn btn-mini btn-primary" name="editar-item" value="Id" title="Editar item">
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
                                                        <button type="submit" class="btn btn-primary" name="excuir-item" value="Id">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th>600</th>
                                        <th>R$ 6000,00</th>
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