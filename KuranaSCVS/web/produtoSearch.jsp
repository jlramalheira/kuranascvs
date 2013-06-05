<%--
    Document   : produtoSearch
    Created on : 30/05/2013, 18:10:35
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Produto"%>
<%@page import="Dao.DaoFornecedor"%>
<%@page import="java.util.List"%>
<%@page import="Model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Fornecedor> fornecedores = new DaoFornecedor().list();
List<Produto> produtos =  (List<Produto>) session.getAttribute("produtos"); %>
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
                            <form method="get" action="Produto" class="well">
                                <fieldset>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira o nome comercial"/>
                                    <div class="more-options hide">
                                        <label for="codigo-barras">Código de barras</label>
                                        <input type="text" id="codigo-barras" class="" name="codigo-barras" value="" placeholder="Insira o código de barras"/>
                                        <label for="fornecedor">Fornecedor</label>
                                        <select id="fornecedor" name="fornecedor" class="input-xlarge">
                                            <option value="0">Escolha um Fornecedor</option>
                                            <%for (Fornecedor fornecedor : fornecedores){ %>
                                                <option value="<%=fornecedor.getId()%>"><%=fornecedor.getNome()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if((produtos != null) && !(produtos.isEmpty())){ %>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Fornecedor</th>
                                        <th>Valor de Venda</th>
                                        <th>Estoque</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for(Produto produto : produtos){ %>
                                    <tr>
                                        <td><%=produto.getId()%></td>
                                        <td><%=produto.getNome()%></td>
                                        <td><%=produto.getFornecedor().getNome()%></td>
                                        <td>R$ <%=produto.getValorVenda()%></td>
                                        <td><%=produto.getEstoqueAtual()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
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
<%session.removeAttribute("produtos"); %>