<%--
    Document   : clienteView
    Created on : 30/05/2013, 15:42:52
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
                                    <li class="nav-header">Gerenciamento</li>
                                    <li class=""><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">José Maria de Jesus</h2>
                            <p>
                                Cliente desde 08/08/2008<br/>
                                <strong>CPF:</strong> 888.888.888-88<br/>
                                <strong>CNPJ:</strong> 888.888.888-88
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>Telefone:</strong> (44) 8888-8888<br/>
                                <strong>Email:</strong> jose@maria.com.br
                            </p>
                            <h3>Endereço</h3>
                            <address>
                                Logradouro das Maravilhas, Número, Complemento<br/>
                                Cidade - UF<br/>
                                <strong>CEP:</strong> 88888-888
                            </address>

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
