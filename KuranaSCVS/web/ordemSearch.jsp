<%--
    Document   : ordemSearch
    Created on : 06/06/2013, 09:03:28
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
                            <table class="table table-hover table-striped table-row-click">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Cliente</th>
                                        <th>Pedido</th>
                                        <th>Entrega</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr onclick="location = 'Venda?operacao=Ver&idCompra='">
                                        <td>1</td>
                                        <td>Marcão Intercomp</td>
                                        <td>01/01/2001</td>
                                        <td>02/02/2002</td>
                                        <td>

                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>

                                            <span class="btn btn-mini btn-success disabled" title="Finalizada">
                                                <i class="icon-ok icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-danger disabled" title="Cancelada">
                                                <i class="icon-remove icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-warning disabled" title="Atrasada">
                                                <i class="icon-exclamation-sign icon-white"></i>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr onclick="location = 'Venda?operacao=Ver&idCompra='">
                                        <td>1</td>
                                        <td>Marcão Intercomp</td>
                                        <td>01/01/2001</td>
                                        <td>02/02/2002</td>
                                        <td>

                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>

                                            <span class="btn btn-mini btn-success disabled" title="Finalizada">
                                                <i class="icon-ok icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-danger disabled" title="Cancelada">
                                                <i class="icon-remove icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-warning disabled" title="Atrasada">
                                                <i class="icon-exclamation-sign icon-white"></i>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr onclick="location = 'Venda?operacao=Ver&idCompra='">
                                        <td>1</td>
                                        <td>Marcão Intercomp</td>
                                        <td>01/01/2001</td>
                                        <td>02/02/2002</td>
                                        <td>

                                            <span class="btn btn-mini btn-primary disabled" title="Em andamento">
                                                <i class="icon-random icon-white"></i>
                                            </span>

                                            <span class="btn btn-mini btn-success disabled" title="Finalizada">
                                                <i class="icon-ok icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-danger disabled" title="Cancelada">
                                                <i class="icon-remove icon-white"></i>
                                            </span>
                                            <span class="btn btn-mini btn-warning disabled" title="Atrasada">
                                                <i class="icon-exclamation-sign icon-white"></i>
                                            </span>
                                        </td>
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
