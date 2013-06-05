<%--
    Document   : vendaCreate
    Created on : 04/06/2013, 22:51:58
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoCliente"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%List<Cliente> clientes = new DaoCliente().list();
    String clienteAutoComplete = "[";
    for (Cliente cliente : clientes) {
        clienteAutoComplete += "\"" + cliente.getId() + " - " + cliente.getNome() + "\",";
    }
    if (clientes.size() > 0) {
        clienteAutoComplete = clienteAutoComplete.substring(0, clienteAutoComplete.length() - 1);
    }
    clienteAutoComplete += "]";
%>
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
                                    <li class="nav-header">Vendas</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar nova</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Cadastrar venda</h2>
                            <form action="Venda" method="post" class="well">
                                <fieldset>
                                    <label for="cliente">Cliente</label>
                                    <input type="text" id="cliente" class="input-xxlarge"
                                           name="cliente" value="" autocomplete="off"
                                           data-provide="typeahead"
                                           data-itens="<%=clientes.size()%>"
                                           data-source='<%=clienteAutoComplete%>'
                                           placeholder="Insira o nome do cliente"/>
                                </fieldset>
                                <button type="submit" class="btn btn-primary btn-large" name="operacao" value="Cadastrar">Cadastrar</button>
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