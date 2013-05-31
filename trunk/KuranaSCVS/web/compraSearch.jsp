<%--
    Document   : compraSearch
    Created on : 31/05/2013, 15:15:32
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
                            <h2>Controle de compras</h2>
                            <form class="well" method="get" action="Fornecedor">
                                <fieldset>
                                    <label for="fornecedor">Fornecedor</label>
                                    <select name="fornecedor">
                                        <option value="id">Fornecedor 1</option>
                                        <option value="id">Fornecedor 2</option>
                                        <option value="id">Fornecedor 3</option>
                                        <option value="id">Fornecedor 4</option>
                                    </select>
                                    <div class="more-options row hide">
                                        <label>Entrega</label>
                                        
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Cadastrar" class="btn btn-large btn-primary">Cadastrar</button>
                                <button type="button" class="btn btn-large" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
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
