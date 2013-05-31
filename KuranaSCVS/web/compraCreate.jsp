<%--
    Document   : compraCreate
    Created on : 31/05/2013, 15:17:39
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
                            <h2>Cadastrar nova compra</h2>
                            <form class="well" method="get" action="Fornecedor">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label><strong>Data: 05/05/2005</strong></label>
                                    <label for="fornecedor">Fornecedor</label>
                                    <select name="fornecedor">
                                        <option value="id">Fornecedor 1</option>
                                        <option value="id">Fornecedor 2</option>
                                        <option value="id">Fornecedor 3</option>
                                        <option value="id">Fornecedor 4</option>
                                    </select>
                                </fieldset>
                                <button type="submit" name="operacao" value="Cadastrar" class="btn btn-large btn-primary">Cadastrar</button>
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
