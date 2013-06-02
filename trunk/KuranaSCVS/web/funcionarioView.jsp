<%--
    Document   : funcionarioView
    Created on : 01/06/2013, 21:26:43
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
                                    <li class="nav-header">Funcionários</li>
                                    <li><a href="#">Pesquisar</a></li>
                                    <li><a href="#">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Nome do Funcionário</h2>
                            <p>
                                <strong>CPF: </strong>000.222.555-55<br/>
                                <strong>Nascimento: </strong>08/08/1988
                            </p>
                            <h3>Contato</h3>
                            <p>
                                <strong>E-mail: </strong>funcionario@empresa.com.br<br/>
                                <strong>Telefone: </strong> (44) 8888-8888
                            </p>
                            <h3>Endereço</h3>
                            <p>
                                Endereço do funcionário
                            </p>
                            <div class="row">
                                <div class="span6">
                                    <h3>Admissões</h3>
                                </div>
                                <div class="span3">
                                    <form method="post" action="">
                                        <a href="#modalAdmitir" role="button" class="btn btn-block btn-primary" data-toggle="modal">Admitir</a>
                                        <div id="modalAdmitir" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3 id="myModalLabel">Admissão</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Deseja admitir o funcionário?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                <button type="submit" class="btn btn-primary" name="operacao" value="admitir">Sim</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Admissão</th>
                                        <th>Demissão</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>08/08/2008</td>
                                        <td>09/09/2009</td>
                                    </tr>
                                    <tr>
                                        <td>08/08/2008</td>
                                        <td>09/09/2009</td>
                                    </tr>
                                    <tr>
                                        <td>08/08/2008</td>
                                        <td>09/09/2009</td>
                                    </tr>
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
