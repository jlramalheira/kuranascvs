<%--
    Document   : funcionarioView
    Created on : 01/06/2013, 21:26:43
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="Dao.DaoFuncionario"%>
<%@page import="Model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idFuncionario") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
        Funcionario funcionario = new DaoFuncionario().get(idFuncionario);
        if (funcionario == null) {
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
                                    <li class="nav-header">Funcionários</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop"><%=funcionario.getNome()%></h2>
                            <p>
                                <strong>CPF: </strong><%=funcionario.getCpf()%><br/>
                                <strong>Nascimento: </strong><%=Util.Util.dateToString(funcionario.getDataNascimento())%><br/>
                                <strong>Salario Base: </strong><%=funcionario.getSalario()%><br/>
                                <strong>Cargo: </strong><%=funcionario.getCargoStr()%><br/>
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>E-mail: </strong><%=funcionario.getEmail()%><br/>
                                <strong>Telefone: </strong><%=funcionario.getTelefone()%>
                            </p>
                            <h3>Endereço</h3>
                            <p>
                                <%=funcionario.getEndereco().getEnderecoStr()%>
                            </p>
                            <div class="row">
                                <div class="span6">
                                    <h3>Admissões</h3>
                                </div>
                                <%if (!funcionario.isContratado()) {%>
                                <div class="span3">
                                    <form method="post" action="Funcionario">
                                        <input type="hidden" name="idFuncionario" value="<%=funcionario.getId()%>" />
                                        <a href="#modalAdmitir" role="button" class="btn btn-block btn-primary margin-top" data-toggle="modal">Admitir</a>
                                        <div id="modalAdmitir" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3 id="myModalLabel">Admissão</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Deseja admitir o funcionário?</p>
                                                <label for="salario-base">Salário base</label>
                                                <div class="input-prepend">
                                                    <span class="add-on">R$</span>
                                                    <input type="text" id="salario-base"
                                                           class="input-small" name="salario-base" value=""/>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                <button type="submit" class="btn btn-primary" name="operacao" value="Admitir">Sim</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <%} else {%>
                                <div class="span3">
                                    <form method="post" action="Funcionario">
                                        <input type="hidden" name="idFuncionario" value="<%=funcionario.getId()%>" />
                                        <a href="#modalDemitir" role="button" class="btn btn-block btn-primary margin-top" data-toggle="modal">Demitir</a>
                                        <div id="modalDemitir" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3 id="myModalLabel">Demissão</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Deseja demitir o funcionário?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                <button type="submit" class="btn btn-primary" name="operacao" value="Demitir">Sim</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <%}%>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Admissão</th>
                                        <th>Demissão</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < funcionario.getDataAdmissao().size(); i++) {%>
                                    <tr>
                                        <td><%=Util.Util.dateToString(funcionario.getDataAdmissao().get(i))%></td>
                                        <td><%=funcionario.getDataDemissao().size() > i ? Util.Util.dateToString(funcionario.getDataDemissao().get(i)) : ""%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

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