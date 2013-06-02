<%--
    Document   : itemVendaServicoCreate
    Created on : 01/06/2013, 20:56:32
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
                                    <li class="nav-header">Vendas</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Inserir item de serviço na venda</h2>
                            <form action="" method="post" class="well">
                                <fieldset>
                                    <legend>Venda #000</legend>
                                    <label for="servico-nome">Serviço</label>
                                    <input id="servico-id" type="hidden" name="produto-id" value="id"/>
                                    <input type="text" id="servico-nome" class="input-xxlarge"
                                           name="servico-nome" value="" autocomplete="off"
                                           data-provide="typeahead"
                                           data-itens="4"
                                           data-source='["1 - 10 - Conserto","2 - 20 - Manutencao","3 - 30 - Entrega","4 - 40 - Limpeza","5 - 50 - Impressão"]'
                                           placeholder="Insira o nome do serviço"/>
                                    <label>Valor Unitário</label>
                                    <input id="servico-preco" type="text"
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
                var precoUnitario = parseFloat($("#servico-preco").val());
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

            $("#servico-nome").change(function(){
                var produtoPreco = parseFloat(this.value.split(" - ")[1]);
                var produtoId = parseInt(this.value.split(" - ")[0]);
                if(isNaN(produtoPreco) && (isNaN(produtoId))){
                    $("#servico-preco").val(0);
                }else{
                    $("#servico-preco").val(produtoPreco);
                    $("#servico-id").val(produtoId);
                }
                alterarTotal();
            });
        </script>
    </body>
</html>
