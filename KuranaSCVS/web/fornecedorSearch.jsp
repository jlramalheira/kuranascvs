<%--
    Document   : fornecedorSearch
    Created on : 31/05/2013, 11:07:44
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Fornecedor> fornecedores = (List<Fornecedor>) session.getAttribute("fornecedores"); %>
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
                            <h2 class="noMarginTop">Controle de fornecedores</h2>
                            <form class="well" method="get" action="Fornecedor">
                                <fieldset>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira o nome para pesquisar"/>
                                    <div class="more-options hide">
                                        <label for="cnpj" class="toggleId">CNPJ</label>
                                        <input type="text" id="cnpj" class="toggleId" name="cnpj" value="" placeholder="Insira um número de CNPJ"/>
                                        <label for="email">E-mail</label>
                                        <input type="email" id="email" class="" name="email" value="" placeholder="Insira um e-mail"/>
                                        <label for="telefone">Telefone</label>
                                        <input type="text" id="telefone" class="" name="telefone" value="" placeholder="Insira um número de telefone"/>
                                        <label for="endereco-logradouro">Logradouro</label>
                                        <input type="text" id="endereco-logradouro" class="input-xxlarge" name="endereco-logradouro" value="" placeholder="Nome da rua, avenida, travessa, etc..."/>
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
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if((fornecedores != null) && (!fornecedores.isEmpty())){ %>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>CNPJ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Fornecedor fornecedor : fornecedores){ %>
                                    <tr>
                                        <td><%=fornecedor.getId()%></td>
                                        <td><%=fornecedor.getNome()%></td>
                                        <td><%=fornecedor.getCnpj()%></td>
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
<%session.removeAttribute("fornecedores"); %>
