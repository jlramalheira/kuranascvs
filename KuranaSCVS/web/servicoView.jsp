<%--
    Document   : servicoView
    Created on : 05/06/2013, 09:49:35
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
                                    <li class="nav-header">Ordens</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                    <li class="nav-header">Serviços</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Serviço #001</h2>
                            <p>
                                <strong>Status:</strong> Ativo/Inativo<br/>
                                <strong>Valor:</strong> R$ 10,00<br/>
                            </p>
                            <h3>Nome do Serviço</h3>
                            <p>
                                Descrição do serviço Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend hendrerit orci, ac rutrum magna gravida id. Quisque elit ligula, viverra eget facilisis quis, lacinia id risus. Quisque fermentum leo turpis, porttitor hendrerit orci. Ut ligula dolor, feugiat et ultricies quis, viverra ac elit. Praesent vestibulum tincidunt commodo. Fusce suscipit condimentum venenatis. Mauris id neque orci, eu volutpat sapien.
                            </p>
                            <div>
                                <a href="#" class="btn btn-large btn-primary">Editar Serviço</a>
                                <a href="#" class="btn btn-large btn-success">Ativar Serviço</a>
                                <a href="#" class="btn btn-large btn-danger">Desativar Serviço</a>
                            </div>


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
