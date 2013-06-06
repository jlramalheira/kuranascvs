<%--
    Document   : ordemCreate
    Created on : 06/06/2013, 08:48:39
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
                            <h2 class="noMarginTop">Cadastrar Ordem de Serviço</h2>
                            <form action="" method="post" class="well">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label for="cliente">Cliente</label>
                                    <input type="text" name="cliente" value=""
                                           id="cliente" class="input-xxlarge" required="" autocomplete="off"
                                           placeholder="Insira o nome do cliente"
                                           data-provide="typeahead"
                                           data-itens="4"
                                           data-source='["1 - Marco","2 - Joao","3 - Max","4 - Eliza"]'/>

                                    <label for="previsao">Previsão de conclusão</label>
                                    <input type="date" name="previsao"
                                           required="required"
                                           class="" id="previsao"/>
                                    <label for="descricao">Descrição</label>
                                    <textarea name="descricao"
                                              id="descricao" class="input-xxlarge"
                                              placeholder="Descreva aqui a ordem de serviço"
                                              ></textarea>
                                </fieldset>
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
