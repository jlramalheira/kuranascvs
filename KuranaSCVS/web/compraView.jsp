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
                            //Compra em andamento
                            <div class="row">
                                <div class="span3">
                                    <form action="" method="post">
                                        <button type="submit" class="btn btn-block btn-info" name="operacao" value="registrar-pagamento">Registrar pagamento</button>
                                        <button type="submit" class="btn btn-block btn-info disabled" disabled="disabled">Pagamento registrado</button>
                                    </form>
                                </div>
                                <div class="span3">
                                    <form action="" method="post">
                                        <button type="submit" class="btn btn-block btn-info" name="operacao" value="registrar-entrega">Registrar entrega</button>
                                        <button type="submit" class="btn btn-block btn-info disabled" disabled="disabled">Entrega registrada</button>
                                    </form>
                                </div>
                                <div class="span3">
                                    <form action="" method="post">
                                        <button type="submit" class="btn btn-block btn-success" name="operacao" value="finalizar">Finalizar compra</button>
                                        <button type="submit" class="btn btn-block btn-danger" name="operacao" value="cancelar">Cancelar compra</button>
                                    </form>
                                </div>
                            </div>
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
                                                <button class="btn btn-mini btn-danger" name="operacao" value="Id" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nome do produto</td>
                                        <td>R$ 10,00</td>
                                        <td>200</td>
                                        <td>R$ 2000,00</td>
                                        <td>
                                            <form action="" method="post" class="no-margin-bottom">
                                                <button class="btn btn-mini btn-danger" name="operacao" value="Id" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Nome do produto</td>
                                        <td>R$ 10,00</td>
                                        <td>200</td>
                                        <td>R$ 2000,00</td>
                                        <td>
                                            <form action="" method="post" class="no-margin-bottom">
                                                <button class="btn btn-mini btn-danger" name="operacao" value="Id" title="Excluir item">
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
            <div id="push"></div>
        </div>
        <%-- FOOTER --%>
        <%@include file="interfaceFooter.jsp" %>
    </body>
</html>
