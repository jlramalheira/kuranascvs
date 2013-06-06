<%--
    Document   : servicoView
    Created on : 05/06/2013, 09:49:35
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Servico"%>
<%@page import="Dao.DaoServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idServico") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idServico = Integer.parseInt(request.getParameter("idServico"));
        Servico servico = new DaoServico().get(idServico);
        if (servico == null) {
            response.sendRedirect("index.jsp");
        } else {
%>
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
                                    <li><a href="Servico?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Servico?operacao=Novo">Cadastrar nova</a></li>
                                    <li class="nav-header">Serviços</li>
                                    <li><a href="OrdemDeServico?operacao=Index">Pesquisar</a></li>
                                    <li><a href="OrdemDeServico?operacao=Novo">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Serviço #<%=servico.getId()%></h2>
                            <p>
                                <strong>Status:</strong> <%=servico.isAtivo() ? "Ativo" : "Inativo"%><br/>
                                <strong>Valor:</strong> R$ <%=servico.getValor()%><br/>
                            </p>
                            <h3><%=servico.getNome()%></h3>
                            <p>
                                <%=servico.getDescricao()%>
                            </p>
                            <div>
                                <a href="#" class="btn btn-large btn-primary">Editar Serviço</a>
                                <%if (servico.isAtivo()) {                                        %>
                                <a href="#" class="btn btn-large btn-danger">Desativar Serviço</a>
                                <%} else {%>
                                <a href="#" class="btn btn-large btn-success">Ativar Serviço</a>
                                <%}%>
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
<% }
    }%>