<%--
    Document   : ordemView
    Created on : 05/06/2013, 20:38:59
    Author     : Max
    Description: Esse documento JSP é utilizado para
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Dao.DaoOrdemDeServico"%>
<%@page import="Model.OrdemDeServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("idOrdem") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int idOrdem = Integer.parseInt(request.getParameter("idOrdem"));
        OrdemDeServico ordem = new DaoOrdemDeServico().get(idOrdem);
        if (ordem == null) {
            response.sendRedirect("index.jsp");
        } else {
            Date hoje = Calendar.getInstance().getTime();
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
                                    <li><a href="OrdemDeServico?operacao=Index">Pesquisar</a></li>
                                    <li><a href="OrdemDeServico?operacao=Novo">Cadastrar nova</a></li>
                                    <li class="nav-header">Serviços</li>
                                    <li><a href="Servico?operacao=Index">Pesquisar</a></li>
                                    <li><a href="Servico?operacao=Novo">Cadastrar novo</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <h2 class="noMarginTop">Ordem de Serviço #<%=ordem.getId()%></h2>
                            <div class="row">
                                <div class="span3">
                                    <strong>Emissão: </strong><%=Util.Util.dateToString(ordem.getDataEmissao())%>
                                </div>
                                <div class="span3">
                                    <strong>Previsão de conclusão: </strong><%=Util.Util.dateToString(ordem.getPrevisaoConclusao())%>
                                </div>
                                <div class="span3">
                                    <strong>Conclusão: </strong><%=ordem.getDataConclusao() != null ? Util.Util.dateToString(ordem.getDataEmissao()) : "Não Concluida"%>
                                </div>
                            </div>
                            <p>
                                <strong>Descrição: </strong> <%=ordem.getDescricao()%>
                            </p>
                            <p>
                                <strong>Cliente:</strong> <%=ordem.getCliente().getNome()%>
                            </p>
                            <h3>Status</h3>
                            <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                            <form action="OrdemDeServico" method="post" class="row">
                                <input type="hidden" name="idOrdem" value="<%=ordem.getId()%>"/>
                                <div class="span3">
                                    <a href="#modalCancelar" role="button" class="btn btn-block btn-danger" data-toggle="modal">Cancelar</a>
                                    <%-- MODAL CANCELAR VENDA --%>
                                    <div id="modalCancelar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Cancelar ordem</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja cancelar a ordem de serviço?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Cancelar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="span3">
                                    <a href="#modalFinalizar" role="button" class="btn btn-block btn-success" data-toggle="modal">Finalizar</a>
                                    <%-- MODAL FINALIZAR VENDA --%>
                                    <div id="modalFinalizar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3 id="myModalLabel">Finalizar ordem</h3>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja finalizar a ordem de serviço?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                            <button type="submit" class="btn btn-primary" name="operacao" value="Finalizar">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%if (hoje.after(ordem.getPrevisaoConclusao())) {%>
                            <div class="row">
                                <div class="span9">
                                    <span class="btn btn-block btn-warning disabled">Atenção! Ordem de serviço atrasada</span>
                                </div>
                            </div>
                            <%}
                            } else if (ordem.getStatusOrdem() == OrdemDeServico.FINALIZADA) {%>
                            <div class="row">
                                <div class="span9">
                                    <span class="btn btn-block btn-success disabled">Ordem de serviço finalizada</span>
                                </div>
                            </div>
                            <%} else {%>
                            <div class="row">
                                <div class="span9">
                                    <span class="btn btn-block btn-danger disabled">Ordem de serviço cancelada</span>
                                </div>
                            </div>
                            <%}%>
                            <div class="row">
                                <div class="span6">
                                    <h3>Serviços</h3>
                                </div>
                                <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar serviço</a>
                                </div>
                                <%}%>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Serviço</th>
                                        <th>Valor Unitário</th>
                                        <th>Quantidade</th>
                                        <th>Total</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Nome do Serviço</td>
                                        <td>R$ 100,00</td>
                                        <td>1</td>
                                        <td>R$ 100,00</td>
                                        <td>
                                            <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                            <form action="ItemServico" method="post" class="no-margin-bottom">
                                                <button type="submit" class="btn btn-mini btn-primary" formaction="ItemServico" formmethod="GET" name="operacao" value="Editar" title="Editar item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirServico" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA ORDEM --%>
                                                <div id="modalExcluirServico" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir serviço da ordem de serviço</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o serviço da ordem de serviço?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th>1</th>
                                        <th>R$ 100</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>

                            <div class="row">
                                <div class="span6">
                                    <h3>Itens da venda</h3>
                                </div>
                                <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar item de venda</a>
                                </div>
                                <%}%>
                            </div>

                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Valor Unitário</th>
                                        <th>Quantidade</th>
                                        <th>Total</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>Nome do produto</td>
                                        <td>R$ 10,00</td>
                                        <td>2</td>
                                        <td>R$ 20,00</td>
                                        <td>
                                            <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                            <form action="ItemVenda" method="post" class="no-margin-bottom">
                                                <button type="submit" class="btn btn-mini btn-primary" formaction="ItemVenda" formmethod="GET" name="operacao" value="Editar" title="Editar Item">
                                                    <i class="icon-edit icon-white"></i>
                                                </button>
                                                <a href="#modalExcluirItem" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA VENDA --%>
                                                <div id="modalExcluirItem" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir item da ordem de serviço</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o item da ordem de serviço?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th>2</th>
                                        <th>R$ 20,00</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>

                            <div class="row">
                                <div class="span6">
                                    <h3>Responsáveis</h3>
                                </div>
                                <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                <div class="span3">
                                    <a href="#" class="btn btn-block btn-primary margin-top">Adicionar funcionário</a>
                                </div>
                                <%}%>
                            </div>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome do Funcionário</th>
                                        <th>Cargo</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Nome do Funcionário</td>
                                        <td>Estagiário</td>
                                        <td>
                                            <%if (ordem.getStatusOrdem() == OrdemDeServico.ANDAMENTO) {%>
                                            <form action="ItemFuncionario" method="post" class="no-margin-bottom">
                                                <a href="#modalExcluirFuncionario" role="button" class="btn btn-mini btn-danger" data-toggle="modal" title="Excluir item">
                                                    <i class="icon-remove icon-white"></i>
                                                </a>
                                                <%-- MODAL EXCLUIR ITEM DA ORDEM --%>
                                                <div id="modalExcluirFuncionario" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h3 id="myModalLabel">Excluir funcionário da ordem de serviço</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja excluir o funcionário da ordem de serviço?</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Não</button>
                                                        <button type="submit" class="btn btn-primary" name="operacao" value="Excluir">Sim</button>
                                                    </div>
                                                </div>
                                            </form>
                                            <%}%>
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
<%}
    }%>