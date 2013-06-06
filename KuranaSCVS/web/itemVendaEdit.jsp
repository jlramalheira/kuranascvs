<%--
    Document   : itemSelectProduto
    Created on : 31/05/2013, 22:28:38
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoItem"%>
<%@page import="Model.Item"%>
<%@page import="Dao.DaoProduto"%>
<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.DaoVenda"%>
<%@page import="Model.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((request.getParameter("idVenda") == null ) || (request.getParameter("idItem") == null)) {
        response.sendRedirect("index.jsp");
    } else {
        int idVenda = Integer.parseInt(request.getParameter("idVenda"));
        int idItem = Integer.parseInt(request.getParameter("idItem"));
        Venda venda = new DaoVenda().get(idVenda);
        Item item = new DaoItem().get(idItem);
        if (venda == null || item == null) {
            response.sendRedirect("index.jsp");
        } else {
            List<Produto> produtos = new DaoProduto().list();
            String produtosAutoComplete = "[";
            for (Produto produto : produtos) {
                if (produto.getEstoqueAtual() > 0) {
                    produtosAutoComplete += "\"" + produto.getId() + " - " + produto.getValorVenda() + " - " + produto.getEstoqueAtual() + " - " + produto.getCodigoDeBarras() + " - " + produto.getNome() + "\",";
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
                            <h2 class="noMarginTop">Editar item de venda</h2>
                            <form action="ItemVenda" method="post" class="well">
                                <fieldset>
                                    <legend>Item da Venda #<%=venda.getId()%></legend>
                                    <label for="produto-nome">Produto</label>
                                    <input id="produto-id" type="hidden" name="produto-id" value="<%=item.getProduto().getId()%>"/>
                                    <input type="hidden" name="idVenda" value="<%=venda.getId()%>" />
                                    <input type="hidden" name="idItem" value="<%=item.getId()%>" />
                                    <input type="text" id="produto-nome" class="input-xxlarge"
                                           name="produto-nome" value="<%=item.getProduto().getNome()%>" autocomplete="off"
                                           data-provide="typeahead"
                                           data-itens="<%=produtos.size()%>"
                                           data-source='<%=produtosAutoComplete%>'
                                           placeholder="Insira o nome do produto"/>
                                    <label>Valor Unitário</label>
                                    <input id="produto-preco" type="text"
                                           class="input-small" disabled="disabled"
                                           name="custo" value="<%=item.getValor()%>" />
                                    <label for="quantidade">Quantidade</label>
                                    <div class="input-append">
                                        <input type="number" id="quantidade" class="input-small"
                                               min="1"
                                               name="quantidade" value="<%=item.getQuantidade()%>"
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
                                           name="custo" value="<%=item.getValorTotal()%>" />
                                    <input id="precoTotal" type="hidden"
                                           name="precoTotal" value="<%=item.getValorTotal()%>" />

                                </fieldset>
                                <button type="submit" class="btn btn-primary btn-large" name="operacao" value="Editar">Editar item</button>
                                <button type="submit" class="btn btn-large" name="operacao" value="Cancelar">Voltar</button>
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
                    $("#precoTotal").val(0);
                }else{
                    $("#total").val(custo);
                    $("#precoTotal").val(custo);
                }
            }

            $("#quantidade").change(function(){
                alterarTotal();
            });

            $("#desconto").change(function(){
                alterarTotal();
            });

            $("#produto-nome").change(function(){
                var estoqueProduto = parseFloat(this.value.split(" - ")[2]);
                var produtoPreco = parseFloat(this.value.split(" - ")[1]);
                var produtoId = parseInt(this.value.split(" - ")[0]);
                if(isNaN(produtoPreco) && (isNaN(produtoId))){
                    $("#produto-preco").val(0);
                }else{
                    $("#produto-preco").val(produtoPreco);
                    $("#produto-id").val(produtoId);
                    $("#quantidade").attr("max", estoqueProduto)
                }
                alterarTotal();
            });
        </script>
    </body>
</html>
<%}
    }%>