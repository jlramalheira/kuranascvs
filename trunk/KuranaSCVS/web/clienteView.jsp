<%--
    Document   : clienteView
    Created on : 30/05/2013, 15:42:52
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Model.Cliente"%>
<%@page import="Dao.DaoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idCliente") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        Cliente cliente = new DaoCliente().get(idCliente);
        if (cliente == null) {
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
                                    <li class="nav-header">Gerenciamento</li>
                                    <li><a href="Cliente?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Cliente?operacao=Novo">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop"><%=cliente.getNome()%></h2>
                            <div class="row">
                                <div class="span6">
                                    <p>
                                        <strong>ID: </strong><%=cliente.getId()%><br/>
                                        <%if (cliente.isJuridica()) {%>
                                        <strong>CNPJ:</strong> <%=cliente.getIdentificacao()%><br/>
                                        <%} else {%>
                                        <strong>CPF:</strong> <%=cliente.getIdentificacao()%><br/>
                                        <%}%>
                                    </p>
                                </div>
                                <div class="span3">
                                    <a href="Cliente?operacao=Editar&idCliente=<%=cliente.getId()%>"
                                       class="btn btn-block btn-primary">
                                        Editar Dados
                                    </a>
                                </div>
                            </div>
                            <p>
                                Cliente desde <%=Util.Util.dateToString(cliente.getDataInsercao())%>
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>Telefone:</strong> <%=cliente.getTelefone()%><br/>
                                <strong>Email:</strong> <%=cliente.getEmail()%>
                            </p>
                            <h3>Endereço</h3>
                            <address>
                                <%=cliente.getEndereco().getEnderecoStr()%>
                                <strong>CEP:</strong> <%=cliente.getEndereco().getCep()%>
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
<%}
    }%>