<%--
    Document   : compraView
    Created on : 31/05/2013, 11:28:59
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <h2 class="noMarginTop">Compra #0111</h2>
                            <div class="row">
                                <div class="span2">
                                    <strong>Data:</strong> 08/08/2008
                                </div>
                                <div class="span2">
                                    <strong>Entrega:</strong> 08/08/2008
                                </div>
                            </div>
                            <strong>Fornecedor:</strong> Nome do Fornecedor
                            <h3>Status da compra</h3>
                            //Compra andamento
                            <form action="" method="post" class="row">
                                <div class="span3">
                                    <button type="submit" name="operacao" value="cancelar" class="btn btn-block btn-danger">
                                        Cancelar
                                    </button>
                                </div>
                                <div class="span3">
                                    <a href="#modalFinalizar" role="button" class="btn" data-toggle="modal">Finalizar</a>
                                    <button type="submit" name="operacao" value="finalizar" class="btn btn-block btn-success">
                                        Finalizar
                                    </button>
                                </div>
                            </form>
                            <p>
                                //Compra finalizada
                                <span class="btn btn-block btn-success disabled">Compra finalizada</span>
                            </p>
                            <p>
                                //Compra Cancelada
                                <span class="btn btn-block btn-danger disabled">Compra cancelada</span>
                            </p>
                            <div class="row">
                                <div class="span6">
                                    <h3 class="noMarginTop">Itens da compra</h3>
                                </div>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar item de compra</a>
                                </div>
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
                                                <button class="btn btn-mini btn-danger" name="excuir-item" value="Id" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </button>
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
            <%-- MODAL FINALIZAR COMPRA --%>
            <div id="modalFinalizar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Finalizar compra</h3>
                </div>
                <div class="modal-body">
                    <p>One fine body…</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    <button class="btn btn-primary">Save changes</button>
                </div>
            </div>
            <div id="push"></div>
        </div>
        <%-- FOOTER --%>
        <%@include file="interfaceFooter.jsp" %>
    </body>
</html>
