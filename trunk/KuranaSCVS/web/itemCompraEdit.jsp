<%--
    Document   : itemCompraEdit
    Created on : 01/06/2013, 13:35:22
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <h2 class="noMarginTop">Editar item de compra</h2>
                            <form action="" method="post" class="well">
                                <fieldset>
                                    <legend>Item da Compra #000</legend>
                                    <input type="hidden" name="compra-id" value="id"/>
                                    <label for="produto-nome">Produto</label>
                                    <input type="hidden" name="produto-id" value="id"/>
                                    <input type="text" id="produto-nome" class="input-xxlarge"
                                           name="produto-nome" value="" autocomplete="off"
                                           data-provide="typeahead"
                                           data-itens="4"
                                           data-source='["1 - 10 - Mouse","2 - 20 - Teclado","3 - 30 - Monitor","4 - 40 - Cartucho","5 - 50 - Maria"]'
                                           placeholder="Insira o nome do produto"/>
                                    <label>Custo Unitário</label>
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
                                    <label>Custo Total</label>
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
                if(isNaN(produtoPreco)){
                    $("#produto-preco").val(0);
                }else{
                    $("#produto-preco").val(produtoPreco);
                }
                alterarTotal();
            });
        </script>
    </body>
</html>