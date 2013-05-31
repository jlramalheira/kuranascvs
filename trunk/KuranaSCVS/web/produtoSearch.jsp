<%--
    Document   : produtoSearch
    Created on : 30/05/2013, 18:10:35
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
                            <h2 class="noMarginTop">Controle de produtos</h2>
                            <form method="get" action="" class="well">
                                <fieldset>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira o nome comercial"/>
                                    <div class="more-options hide">
                                        <label for="codigo-barras">Código de barras</label>
                                        <input type="text" id="codigo-barras" class="" name="codigo-barras" value="" placeholder="Insira o código de barras"/>
                                        <label for="fornecedor">Fornecedor</label>
                                        <select id="fornecedor" name="fornecedor" class="input-xlarge">
                                            <option value="id">Fornecedor 1</option>
                                            <option value="id">Fornecedor 2</option>
                                            <option value="id">Fornecedor 3</option>
                                            <option value="id">Fornecedor 4</option>
                                        </select>
                                    </div>
                                </fieldset>
                                <button type="submit" name="op" value="pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
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
