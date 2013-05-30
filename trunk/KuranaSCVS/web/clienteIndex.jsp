<%--
    Document   : index
    Created on : 28/05/2013, 00:23:13
    Author     : jota meu pau na sua bota
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
                                    <li class="active"><a href="#">Início</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                    <li><a href="#">Pesquisar</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Controle de clientes</h2>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>E-mail</th>
                                        <th>Telefone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>871</td>
                                        <td>José Maria de Jesus</td>
                                        <td>jose@maria.com.br</td>
                                        <td>(44)3523-9555</td>
                                    </tr>
                                    <tr>
                                        <td>871</td>
                                        <td>José Maria de Jesus</td>
                                        <td>jose@maria.com.br</td>
                                        <td>(44)3523-9555</td>
                                    </tr>
                                    <tr>
                                        <td>871</td>
                                        <td>José Maria de Jesus</td>
                                        <td>jose@maria.com.br</td>
                                        <td>(44)3523-9555</td>
                                    </tr>
                                </tbody>
                            </table>
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
