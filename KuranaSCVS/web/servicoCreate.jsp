<%--
    Document   : servicoCreate
    Created on : 05/06/2013, 10:16:44
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
                                    <li><a href="OrdemDeServico?operacao=Pesquisar">Pesquisar</a></li>
                                    <li><a href="OrdemDeServico?operacao=Novo">Cadastrar nova</a></li>
                                    <li class="nav-header">Serviços</li>
                                    <li><a href="Servico?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Servico?operacao=Novo">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Cadastrar novo serviço</h2>
                            <form action="Servico" method="post" class="well">
                                <fieldset>
                                    <legend>Informações</legend>
                                    <label for="nome">Nome</label>
                                    <input type="text" name="nome" value=""
                                           id="nome" class="input-xxlarge" required="required"
                                           placeholder="Insira o nome do serviço"
                                           />
                                    <label for="valor">Valor</label>
                                    <div class="input-prepend">
                                        <span class="add-on">R$</span>
                                        <input type="text" id="valor"
                                               class="input-small" name="valor"
                                               required="required" value=""/>
                                    </div>
                                    <label for="descricao">Descrição</label>
                                    <textarea name="descricao"
                                              id="descricao" class="input-xxlarge"
                                              required="required"
                                              placeholder="A descrição do serviço"></textarea>

                                </fieldset>
                                <button type="submit" name="operacao" value="Cadastrar" class="btn btn-large btn-primary">
                                    Cadastrar
                                </button>
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
