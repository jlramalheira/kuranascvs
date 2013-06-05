<%--
    Document   : itemSelectProduto
    Created on : 31/05/2013, 22:28:38
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoProduto"%>
<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="Model.Venda"%>
<%@page import="Dao.DaoVenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idVenda") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idVenda = Integer.parseInt(request.getParameter("idVenda"));
        Venda venda = new DaoVenda().get(idVenda);
        if (venda == null) {
            response.sendRedirect("index.jsp");
        } else {
            List<Produto> produtos = new DaoProduto().list();
            String produtosAutoComplete = "[";
            for (Produto produto : produtos) {
                if (produto.getEstoqueAtual() > 0) {
                    produtosAutoComplete += "\"" + produto.getId() + " - " + produto.getValorCusto() + " - " + produto.getCodigoDeBarras() + " - " + produto.getNome() + "\",";
                }
            }
            if (produtos.size() > 0) {
                produtosAutoComplete = produtosAutoComplete.substring(0, produtosAutoComplete.length() - 1);
            }
            produtosAutoComplete += "]";
%>
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
                                    <li class="nav-header">Vendas</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Inserir novo item de venda</h2>
                            <form action="" method="post" class="well">
                                <fieldset>
                                    <legend>Item da Venda #000</legend>
                                    <label for="produto-nome">Produto</label>
                                    <input id="produto-id" type="hidden" name="produto-id" value="id"/>
                                    <input type="text" id="produto-nome" class="input-xxlarge"
                                           name="produto-nome" value="" autocomplete="off"
                                           data-provide="typeahead"
                                           data-itens="4"
                                           data-source='["1 - 10 - Mouse","2 - 20 - Teclado","3 - 30 - Monitor","4 - 40 - Cartucho","5 - 50 - Maria"]'
                                           placeholder="Insira o nome do produto"/>
                                    <label>Valor Unitário</label>
                                    <input id="produto-preco" type="text"
                                           class="input-small" disabled="disabled"
                                           name="custo" value="0" />
                                    <label for="quantidade">Quantidade</label>
                                    <div class="input-append">
                                        <input type="number" id="quantidade" class="input-small"
                                               min="1"
                                               name="quantidade" value="1"
                                               />
                                        <span class="add-on">unidades</span>
                                    </div>
                                    <label for="desconto">Desconto</label>
                                    <div class="input-append">
                                        <input type="number" id="desconto" class="input-small"
                                               name="desconto" value="0" min="0" step="any"
                                               />
                                        <span class="add-on">%</span>
                                    </div>
                                    <label>Valor Total</label>
                                    <input id="total" type="text"
                                           class="input-small" disabled="disabled"
                                           name="custo" value="0" />

                                </fieldset>
                                <button type="submit" class="btn btn-primary btn-large" name="operacao" value="create">Adicionar item</button>
                                <button type="submit" class="btn btn-large" name="operacao" value="cancel">Voltar</button>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
            <div id="push"></div>
        </div>
        <%-- FOOTER --%>
        <%@include file="interfaceFooter.jsp" %>
        <script type="text/javascript">
            function alterarTotal(){
                var precoUnitario = parseFloat($("#produto-preco").val());
                var quantidade = parseInt($("#quantidade").val());
                var desconto = parseFloat($("#desconto").val()) / 100;
                var custo = (precoUnitario - (precoUnitario * desconto)) * quantidade;
                if(isNaN(custo)){
                    $("#total").val(0);
                }else{
                    $("#total").val(custo);
                }
            }

            $("#quantidade").change(function(){
                alterarTotal();
            });

            $("#desconto").change(function(){
                alterarTotal();
            });

            $("#produto-nome").change(function(){
                var produtoPreco = parseFloat(this.value.split(" - ")[1]);
                var produtoId = parseInt(this.value.split(" - ")[0]);
                if(isNaN(produtoPreco) && (isNaN(produtoId))){
                    $("#produto-preco").val(0);
                }else{
                    $("#produto-preco").val(produtoPreco);
                    $("#produto-id").val(produtoId);
                }
                alterarTotal();
            });
        </script>
    </body>
</html>
<%}
    }%>