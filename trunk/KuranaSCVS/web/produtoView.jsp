<%--
    Document   : produtoView
    Created on : 30/05/2013, 16:08:18
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
                            <h2 class="noMarginTop">Nome comercial do produto</h2>
                            <p>
                                <strong>ID: </strong>88888888-99<br/>
                                <strong>Fornecedor: </strong>Nome do fornecedor<br/>
                            </p>
                            <h3>Valor</h3>
                            <p>
                                <strong>Valor de custo: </strong>R$ 80,00<br/>
                                <strong>Valor de venda: </strong>R$ 100,00<br/>
                                <strong>Lucro: </strong>25%<br/>
                            </p>
                            <h3>Estoque</h3>
                            <p>
                                <strong>Estoque atual: </strong>189 unidades<br/>
                                <strong>Estoque mínimo: </strong>25 unidades<br/>
                                <strong>Status: </strong>Normal<br/>
                            </p>

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
