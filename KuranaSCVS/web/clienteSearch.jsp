<%--
    Document   : index
    Created on : 28/05/2013, 00:23:13
    Author     : jota meu pau na sua bota
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
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
                                    <li class="nav-header">Gerenciamento</li>
                                    <li class="active"><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Controle de clientes</h2>
                            <form class="well">
                                <fieldset>
                                    <label for="nome">Nome</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira um nome para pesquisar"/>
                                    <div class="hide more-options">
                                        <label for="isJuridica" class="checkbox">
                                            <input type="checkbox" id="isJuridica" class="" name="isJuridica" value="juridica"/>
                                            Pessoa Jurídica
                                        </label>
                                        <label for="cpf" class="toggleId show">CPF</label>
                                        <input type="text" id="cpf" class="toggleId show" name="cpf" value="" placeholder="Insira um número de CPF"/>
                                        <label for="cnpj" class="toggleId hide">CNPJ</label>
                                        <input type="text" id="cnpj" class="toggleId hide" name="cnpj" value="" placeholder="Insira um número de CNPJ"/>
                                        <label for="email">E-mail</label>
                                    <input type="email" id="email" class="" name="email" value="" placeholder="Insira um e-mail"/>
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
                                <button type="submit" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>

                            </form>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>CPF/CNPJ</th>
                                        <th>Cliente desde</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>871</td>
                                        <td>José Maria de Jesus</td>
                                        <td>888.888.888-88</td>
                                        <td>03/03/2003</td>
                                    </tr>
                                    <tr>
                                        <td>871</td>
                                        <td>Farmácias Farmapred</td>
                                        <td>00.000.000/0000-00</td>
                                        <td>03/03/2003</td>
                                    </tr>
                                </tbody>
                            </table>
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
