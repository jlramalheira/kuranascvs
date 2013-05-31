<%--
    Document   : fornecedorView
    Created on : 31/05/2013, 10:47:06
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
                                    <li class="nav-header">Produtos</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar Novo</a></li>
                                     <li class="nav-header">Fornecedores</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar Novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Nome do fornecedor</h2>
                            <p>
                                <strong>ID: </strong>8441<br/>
                                <strong>CNPJ: </strong>8888888<br/>
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>Telefone:</strong> (44) 4444-4444<br/>
                                <strong>Email:</strong> empresa@fornecedor.com.br
                            </p>
                            <h3>Endereço</h3>
                            <address>
                                Logradouro do fornecedor, Numero, Complemento<br/>
                                Cidade - UF<br/>
                                <strong>CEP:</strong> 88888-888
                            </address>
                            <h3>Produtos</h3>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Fornecedor</th>
                                        <th>Valor de Venda</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>88</td>
                                        <td>Nome do produto</td>
                                        <td>Nome do fornecedor</td>
                                        <td>R$ 100,00</td>
                                    </tr>
                                    <tr>
                                        <td>88</td>
                                        <td>Nome do produto</td>
                                        <td>Nome do fornecedor</td>
                                        <td>R$ 100,00</td>
                                    </tr>
                                    <tr>
                                        <td>88</td>
                                        <td>Nome do produto</td>
                                        <td>Nome do fornecedor</td>
                                        <td>R$ 100,00</td>
                                    </tr>
                                </tbody>
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
