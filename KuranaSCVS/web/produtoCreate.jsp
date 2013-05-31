<%--
    Document   : produtoCreate
    Created on : 30/05/2013, 16:25:59
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoFornecedor"%>
<%@page import="Model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Fornecedor> fornecedores = new DaoFornecedor().list(); %>
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
                            <h2>Cadastrar novo produto</h2>
                            <form class="well" method="post" action="Produto">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira o nome comercial"/>
                                    <label for="codigo-barras">Código de barras</label>
                                    <input type="text" id="codigo-barras" class="" name="codigo-barras" value="" placeholder="Insira o código de barras"/>
                                    <label for="fornecedor">Fornecedor</label>
                                    <select id="fornecedor" name="fornecedor" class="input-xlarge">
                                        <option value="0">Escolha um Fornecedor</option>
                                        <%for (Fornecedor fornecedor : fornecedores){ %>
                                            <option value="<%=fornecedor.getId()%>"><%=fornecedor.getNome()%></option>
                                        <%}%>
                                    </select>
                                </fieldset>
                                <fieldset>
                                    <legend>Valor</legend>
                                    <label for="valor-custo">Valor de custo</label>
                                    <div class="input-prepend">
                                        <span class="add-on">R$</span>
                                        <input type="text" id="valor-custo" class="input-small" name="valor-custo" value=""/>
                                    </div>
                                    <label for="valor-venda">Valor de venda</label>
                                    <div class="input-prepend">
                                        <span class="add-on">R$</span>
                                        <input type="text" id="valor-venda" class="input-small" name="valor-venda" value=""/>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>Estoque</legend>
                                    <div class="input-append">
                                        <label for="estoque-minimo">Estoque mínimo</label>
                                        <input type="text" id="estoque-minimo" class="input-small" name="estoque-minimo" value=""/>
                                        <span class="add-on">unidades</span>
                                    </div>
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
