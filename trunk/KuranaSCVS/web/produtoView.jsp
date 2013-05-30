<%--
    Document   : produtoView
    Created on : 30/05/2013, 16:08:18
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoProduto"%>
<%@page import="Model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idProduto") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        Produto produto = new DaoProduto().get(idProduto);
        if (produto == null) {
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
                            <h2 class="noMarginTop"><%=produto.getNome()%></h2>
                            <p>
                                <strong>Codigo de barras: </strong><%=produto.getCodigoDeBarras()%><br/>
                                <strong>Fornecedor: </strong><%=produto.getFornecedor().getNome()%><br/>
                            </p>
                            <h3>Valor</h3>
                            <p>
                                <strong>Valor de custo: </strong>R$ <%=produto.getValorCusto()%><br/>
                                <strong>Valor de venda: </strong>R$ <%=produto.getValorVenda()%><br/>
                                <strong>Lucro: </strong><%=produto.getLucro()%><br/>
                            </p>
                            <h3>Estoque</h3>
                            <p>
                                <strong>Estoque atual: </strong><%=produto.getEstoqueAtual()%><br/>
                                <strong>Estoque mínimo: </strong><%=produto.getEstoqueMinimo()%><br/>
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
<%}
    }%>