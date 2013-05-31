<%--
    Document   : fornecedorView
    Created on : 31/05/2013, 10:47:06
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="java.util.List"%>
<%@page import="Dao.DaoProduto"%>
<%@page import="Model.Produto"%>
<%@page import="Model.Fornecedor"%>
<%@page import="Dao.DaoFornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idFornecedor") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idProduto = Integer.parseInt(request.getParameter("idFornecedor"));
        Fornecedor fornecedor = new DaoFornecedor().get(idProduto);
        if (fornecedor == null) {
            response.sendRedirect("index.jsp");
        } else {
            List<Produto> produtos = new DaoProduto().listByFornecedor(fornecedor.getId());
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
                            <h2 class="noMarginTop"><%=fornecedor.getNome()%></h2>
                            <p>
                                <strong>ID: </strong><%=fornecedor.getId()%><br/>
                                <strong>CNPJ: </strong><%=fornecedor.getCnpj()%><br/>
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>Telefone:</strong> <%=fornecedor.getTelefone()%><br/>
                                <strong>Email:</strong> <%=fornecedor.getEmail()%>
                            </p>
                            <h3>Endereço</h3>
                            <address>
                                <%=fornecedor.getEndereco().getEnderecoStr()%><br/>
                                <strong>CEP:</strong> <%=fornecedor.getEndereco().getCep()%>
                            </address>
                            <h3>Produtos</h3>
                            <%if (!produtos.isEmpty()){ %>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Valor de Venda</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Produto produto : produtos){ %>
                                    <tr>
                                        <td><%=produto.getId()%></td>
                                        <td><%=produto.getNome()%></td>
                                        <td>R$<%=produto.getValorVenda()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                            <%} else {%>
                                <p>Não existem produtos deste fornecedor</p>
                            <%}%>
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