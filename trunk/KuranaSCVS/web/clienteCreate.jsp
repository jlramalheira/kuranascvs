<%--
    Document   : blank
    Created on : 30/05/2013, 00:22:18
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta charset="utf-8">
        <title>Kurana SCVS :: Software de Controle de Vendas e Serviços</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/sticky-footer.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="nonFooter">
            <%-- HEADER --%>
            <header class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="brand" href="#">Kurana SCVS</a>
                        <nav>
                            <ul class="nav nav-collapse collapse">
                                <li class="active"><a href="#">Clientes</a></li>
                                <li><a href="#">Produtos</a></li>
                                <li><a href="#">Compras</a></li>
                                <li><a href="#">Vendas</a></li>
                                <li><a href="#">Serviços</a></li>
                                <li><a href="#">Funcionários</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </header>
            <div id="main">
                <div class="container">
                    <div class="row">
                        <div class="span3">
                            <div class="well sidebar-nav">
                                <ul class="nav nav-list">
                                    <li class="nav-header">Gerenciamento</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li class="active"><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Cadastrar novo cliente</h2>
                            <form method="post" action="">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label for="nome">Nome completo</label>
                                    <input type="text" id="nome" class="input-xxlarge" name="nome" value="" placeholder="Insira o nome completo"/>
                                    <label for="isJuridica" class="checkbox">
                                        <input type="checkbox" id="isJuridica" class="" name="isJuridica" value="juridica"/>
                                        Pessoa Jurídica
                                    </label>
                                    <label for="cpf" class="toggleId show">CPF</label>
                                    <input type="text" id="cpf" class="toggleId show" name="cpf" value="" placeholder="Insira um número de CPF"/>
                                    <label for="cnpj" class="toggleId hide">CNPJ</label>
                                    <input type="text" id="cnpj" class="toggleId hide" name="cnpj" value="" placeholder="Insira um número de CNPJ"/>

                                </fieldset>
                                <fieldset>
                                    <legend>Contato</legend>
                                    <label for="email">E-mail</label>
                                    <input type="email" id="email" class="" name="email" value="" placeholder="Insira um e-mail"/>
                                    <label for="telefone">Telefone</label>
                                    <input type="text" id="telefone" class="" name="telefone" value="" placeholder="Insira um número de telefone"/>
                                    <label for="endereco-logradouro">Logradouro</label>
                                    <input type="text" id="endereco-logradouro" class="input-xxlarge" name="endereco-logradouro" value="" placeholder="Nome da rua, avenida, travessa, etc..."/>
                                    <label for="endereco-numero">Número</label>
                                    <input type="text" id="endereco-numero" class="input-small" name="endereco-numero" value="" placeholder="Número"/>
                                    <label for="endereco-cidade">Cidade</label>
                                    <input type="text" id="endereco-cidade" class="" name="endereco-cidade" value="" placeholder="Nome da cidade"/>
                                    <label for="endereco-estado">Estado</label>
                                    <select name="endereco-estado" id="endereco-estado">
                                        <option value="0">Selecione o Estado</option>
                                        <option value="ac">Acre</option>
                                        <option value="al">Alagoas</option>
                                        <option value="ap">Amapá</option>
                                        <option value="am">Amazonas</option>
                                        <option value="ba">Bahia</option>
                                        <option value="ce">Ceará</option>
                                        <option value="df">Distrito Federal</option>
                                        <option value="es">Espirito Santo</option>
                                        <option value="go">Goiás</option>
                                        <option value="ma">Maranhão</option>
                                        <option value="ms">Mato Grosso do Sul</option>
                                        <option value="mt">Mato Grosso</option>
                                        <option value="mg">Minas Gerais</option>
                                        <option value="pa">Pará</option>
                                        <option value="pb">Paraíba</option>
                                        <option value="pr">Paraná</option>
                                        <option value="pe">Pernambuco</option>
                                        <option value="pi">Piauí</option>
                                        <option value="rj">Rio de Janeiro</option>
                                        <option value="rn">Rio Grande do Norte</option>
                                        <option value="rs">Rio Grande do Sul</option>
                                        <option value="ro">Rondônia</option>
                                        <option value="rr">Roraima</option>
                                        <option value="sc">Santa Catarina</option>
                                        <option value="sp">São Paulo</option>
                                        <option value="se">Sergipe</option>
                                        <option value="to">Tocantins</option>
                                    </select>
                                </fieldset>
                                <button type="submit" class="btn btn-large btn-primary">Cadastrar</button>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
            <div id="push"></div>
        </div>
        <footer class="stickyFooter">
            <div class="container">
                Kurana SCVS - 2013
            </div>
        </footer>
        <%-- Javascript --%>
        <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/interface.js" type="text/javascript"></script>
    </body>
</html>

