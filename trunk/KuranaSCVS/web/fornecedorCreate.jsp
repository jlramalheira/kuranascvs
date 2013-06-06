<%--
    Document   : fornecedorCreate
    Created on : 31/05/2013, 11:03:13
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
                                    <li class="nav-header">Produtos</li>
                                    <li><a href="Produto?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Produto?operacao=Novo">Cadastrar Novo</a></li>
                                     <li class="nav-header">Fornecedores</li>
                                    <li><a href="Fornecedor?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Fornecedor?operacao=Novo">Cadastrar Novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2>Cadastrar novo fornecedor</h2>
                            <form class="well" method="post" action="Fornecedor">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge"
                                           name="nome" value=""
                                           required="required"
                                           placeholder="Insira o nome"/>
                                    <label for="cnpj" class="toggleId">CNPJ</label>
                                    <input type="text" id="cnpj" class="toggleId"
                                           name="cnpj" value=""
                                           required="required"
                                           placeholder="Insira um número de CNPJ"/>
                                </fieldset>
                                <fieldset>
                                    <legend>Contato</legend>
                                    <label for="email">E-mail</label>
                                    <input type="email" id="email" class=""
                                           name="email" value=""
                                           placeholder="Insira um e-mail"/>
                                    <label for="telefone">Telefone</label>
                                    <input type="text" id="telefone" class=""
                                           name="telefone" value=""
                                           placeholder="Insira um número de telefone"/>
                                </fieldset>
                                <fieldset>
                                    <legend>Endereço</legend>
                                    <label for="endereco-cep">CEP</label>
                                    <input type="text" id="endereco-cep" class=""
                                           name="endereco-cep" value=""

                                           placeholder="Código de endereçamento"/>
                                    <label for="endereco-logradouro">Logradouro</label>
                                    <input type="text" id="endereco-logradouro" class="input-xxlarge" name="endereco-logradouro" value="" placeholder="Nome da rua, avenida, travessa, etc..."/>
                                    <label for="endereco-numero">Número</label>
                                    <input type="text" id="endereco-numero" class="input-small" name="endereco-numero" value="" placeholder="Número"/>
                                    <label for="endereco-complemento">Complemento</label>
                                    <input type="text" id="endereco-complemento" class="" name="endereco-complemento" value="" placeholder="Informação adicional"/>
                                    <label for="endereco-cidade">Cidade</label>
                                    <input type="text" id="endereco-cidade" class="" name="endereco-cidade" value="" placeholder="Nome da cidade"/>
                                    <label for="endereco-estado">Estado</label>
                                    <select name="endereco-estado" id="endereco-estado">
                                        <option value="">Selecione o Estado</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espirito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
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
