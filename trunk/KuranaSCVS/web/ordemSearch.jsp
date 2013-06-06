<%--
    Document   : ordemSearch
    Created on : 06/06/2013, 09:03:28
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Model.OrdemDeServico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%List<OrdemDeServico> ordens = (List<OrdemDeServico>) request.getAttribute("ordens");
    Date hoje = Calendar.getInstance().getTime();%>
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
                            <h2 class="noMarginTop">Controle de Ordens de Serviço</h2>
                            <form action="" method="get" class="well">
                                <fieldset>
                                    <label for="cliente">Cliente</label>
                                    <input type="text" id="cliente" class="input-xxlarge"
                                           name="cliente" value=""
                                           placeholder="Insira o nome do cliente"/>
                                    <div class="more-options hide">
                                        <label><strong>Data do Pedido</strong></label>
                                        <div class="row">
                                            <div class="span3">
                                                <label for="pedido-inicio">Inicio</label>
                                                <input type="date" id="pedido-inicio"
                                                       name="pedido-inicio"/>
                                            </div>
                                            <div class="span3">
                                                <label for="pedido-fim">Fim</label>
                                                <input type="date" id="pedido-fim"
                                                       name="pedido-fim"/>
                                            </div>
                                        </div>
                                        <label><strong>Data de Conclusao</strong></label>
                                        <div class="row">
                                            <div class="span3">
                                                <label for="conclusao-inicio">Inicio</label>
                                                <input type="date" id="conclusao-inicio"
                                                       name="conclusao-inicio"/>
                                            </div>
                                            <div class="span3">
                                                <label for="conclusao-fim">Fim</label>
                                                <input type="date" id="conclusao-fim"
                                                       name="conclusao-fim"/>
                                            </div>
                                        </div>
                                        <label class="radio">
                                            <input type="radio" name="status" value="0"/>
                                            Em andamento
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="status" value="1"/>
                                            Finalizada
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="status" value="2"/>
                                            Cancelada
                                        </label>
                                    </div>
                                </fieldset>
                                <button type="submit" name="operacao" value="Pesquisar" class="btn btn-primary">Pesquisar</button>
                                <button type="button" class="btn" onclick="toggleOptions(this)">Mais Opções</button>
                            </form>
                            <%if ((ordens != null) && (!ordens.isEmpty())) {%>
                            <table class="table table-hover table-striped table-row-click">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Cliente</th>
                                        <th>Emissão</th>
                                        <th>Previsão</th>
                                        <th>Conclusao</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (OrdemDeServico ordem : ordens) {%>
                                    <tr onclick="location = 'Venda?operacao=Ver&idOrdem=<%=ordem.getId()%>'">
                                        <td><%=ordem.getId()%></td>
                                        <td><%=ordem.getCliente() != null ? ordem.getCliente().getNome() : ""%></td>
                                        <td><%=Util.Util.dateToString(ordem.getDataEmissao())%></td>
                                        <td><%=Util.Util.dateToString(ordem.getPrevisaoConclusao())%></td>
                                        <td><%=ordem.getDataConclusao() != null ? Util.Util.dateToString(ordem.getPrevisaoConclusao()) : "Não concluida"%></td>
                                        <td>
                                            <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>
                                            <% if (hoje.after(ordem.getPrevisaoConclusao())) {%>
                                            <span class="btn btn-mini btn-warning disabled" title="Atrasada">
                                                <i class="icon-exclamation-sign icon-white"></i>
                                            </span>
                                            <%}
                                            } else if (ordem.getStatusOrdem() == OrdemDeServico.FINALIZADA) {%>
                                            <span class="btn btn-mini btn-success disabled" title="Finalizada">
                                                <i class="icon-ok icon-white"></i>
                                            </span>
                                            <%} else if (ordem.getStatusOrdem() == OrdemDeServico.CANCELADA) {%>
                                            <span class="btn btn-mini btn-danger disabled" title="Cancelada">
                                                <i class="icon-remove icon-white"></i>
                                            </span>
                                            <%}%>
                                        </td>
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
