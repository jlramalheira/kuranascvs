<%--
    Document   : servicoSearch
    Created on : 05/06/2013, 10:35:35
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Servico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<Servico> servicos = (List<Servico>) session.getAttribute("servicos"); %>
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
                            <h2 class="noMarginTop">Controle de Serviços</h2>
                            <form class="well" action="Servico" method="get">
                                <fieldset>
                                    <label for="nome">Nome</label>
                                    <input type="text" name="nome" value=""
                                           id="nome" class="input-xxlarge"
                                           placeholder="Insira o nome do serviço"
                                           />
                                    <div class="more-options hide">
                                        <label for="valor">Valor</label>
                                        <div class="input-prepend">
                                            <span class="add-on">R$</span>
                                            <input type="text" id="valor"
                                                   class="input-small"
                                                   name="valor" value=""/>
                                        </div>
                                        <label for="descricao">Descrição</label>
                                        <input type="text" name="descricao" value=""
                                               id="descricao" class="input-xxlarge"
                                               placeholder=""
                                               />
                                        <label class="radio">
                                            <input type="radio" name="ativo" value="true"/>
                                            Ativa
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="ativo" value="false"/>
                                            Inativa
                                        </label>
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if ((servicos != null) && (!servicos.isEmpty())){ %>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Valor</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Servico servico : servicos){ %>
                                    <tr>
                                        <td><%=servico.getId()%></td>
                                        <td><%=servico.getNome()%></td>
                                        <td>R$ <%=servico.getValor()%></td>
                                        <td><%=servico.isAtivo()? "Ativo" : "Inativo"%></td>
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
