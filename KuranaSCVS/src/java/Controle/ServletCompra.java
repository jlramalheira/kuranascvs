/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCompra;
import Dao.DaoFornecedor;
import Model.Compra;
import Model.Fornecedor;
import Model.Item;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joao Luiz
 */
@WebServlet(name = "Compra", urlPatterns = {"/Compra"})
public class ServletCompra extends HttpServlet {

    DaoCompra daoCompra = new DaoCompra();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "Pesquisar":
                int idFornecedor = Integer.parseInt(request.getParameter("fornecedor"));

                int status = -1;
                if (request.getParameter("status") != null) {
                    status = Integer.parseInt(request.getParameter("status"));
                }

                //verifica quais datas foram colocadas e converte elas para o padrao correto
                String dataPedidoInicio = request.getParameter("pedido-inicio");
                if (dataPedidoInicio.isEmpty()) {
                    dataPedidoInicio = null;
                }
                String dataPedidoFim = request.getParameter("pedido-fim");
                if (dataPedidoFim.isEmpty()) {
                    dataPedidoFim = null;
                }
                String dataEntregaInicio = request.getParameter("entrega-inicio");
                if (dataEntregaInicio.isEmpty()) {
                    dataEntregaInicio = null;
                }
                String dataEntregaFim = request.getParameter("entrega-fim");
                if (dataEntregaFim.isEmpty()) {
                    dataEntregaFim = null;
                }

                List<Compra> compras = null;

                //verifica qual list deve pegar
                if (dataPedidoInicio != null) {
                    if (dataPedidoFim != null) {
                        if (dataEntregaInicio != null) {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByAll(dataPedidoInicio, dataPedidoFim, dataEntregaInicio, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoInicioPedidoFimEntregaIncio(dataPedidoInicio, dataPedidoFim, dataEntregaInicio, idFornecedor, status);
                            }
                        } else {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataPedidoInicioPedidoFimEntregaFim(dataPedidoInicio, dataPedidoFim, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoInicioFim(dataPedidoInicio, dataPedidoFim, idFornecedor, status);
                            }
                        }
                    } else {
                        if (dataEntregaInicio != null) {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataPedidoInicioEntregaIncioEntregaFim(dataPedidoInicio, dataEntregaInicio, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoInicioEntregaInicio(dataPedidoInicio, dataEntregaInicio, idFornecedor, status);
                            }
                        } else {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataPedidoInicioEntregaFim(dataPedidoInicio, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoInicio(dataPedidoInicio, idFornecedor, status);
                            }
                        }
                    }
                } else {
                    if (dataPedidoFim != null) {
                        if (dataEntregaInicio != null) {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataPedidoFimEntregaIncioEntregaFim(dataPedidoFim, dataEntregaInicio, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoFimEntregaInicio(dataPedidoFim, dataEntregaInicio, idFornecedor, status);
                            }
                        } else {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataPedidoFimEntregaFim(dataPedidoFim, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataPedidoFim(dataPedidoFim, idFornecedor, status);
                            }
                        }
                    } else {
                        if (dataEntregaInicio != null) {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataEntregaInicioFim(dataEntregaInicio, dataEntregaFim, idFornecedor, status);
                            } else {
                                compras = daoCompra.listByDataEntregaInicio(dataEntregaInicio, idFornecedor, status);
                            }
                        } else {
                            if (dataEntregaFim != null) {
                                compras = daoCompra.listByDataEntregaFim(dataEntregaFim, idFornecedor, status);
                            } else {
                                if ((idFornecedor <= 0) && (status < 0)) {
                                    compras = daoCompra.list();
                                } else {
                                    compras = daoCompra.listSimple(idFornecedor, status);
                                }
                            }
                        }
                    }
                }

                session.setAttribute("compras", compras);
                rd = request.getRequestDispatcher("compraSearch.jsp");
                rd.forward(request, response);
                break;
            case "Index" :
                rd = request.getRequestDispatcher("compraSearch.jsp");
                rd.forward(request, response);
                break;
            case "Ver" :
                rd = request.getRequestDispatcher("compraView.jsp");
                rd.forward(request, response);
                break;
            case "Novo" :
                rd = request.getRequestDispatcher("compraCreate.jsp");
                rd.forward(request, response);
                break;
            default:
                rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");
        switch (operacao) {
            case "Cadastrar":
                int idFornecedor = Integer.parseInt(request.getParameter("fornecedor"));

                Fornecedor fornecedor = new DaoFornecedor().get(idFornecedor);
                Date dataCompra = Calendar.getInstance().getTime();
                List<Item> itensCompra = new ArrayList<Item>();
                Compra compra = new Compra(dataCompra, null, fornecedor, Compra.ANDAMENTO, itensCompra);

                daoCompra.insert(compra);

                response.sendRedirect("compraView.jsp?idCompra=" + compra.getId());
                break;
            case "Cancelar":
                int idCompra = Integer.parseInt(request.getParameter("idCompra"));

                Compra compraCancela = daoCompra.get(idCompra);

                compraCancela.setStatusCompra(Compra.CANCELADA);

                daoCompra.update(compraCancela);

                response.sendRedirect("compraView.jsp?idCompra=" + compraCancela.getId());
                break;
            case "Finalizar":
                int idCompraFinaliza = Integer.parseInt(request.getParameter("idCompra"));

                Compra compraFinaliza = daoCompra.get(idCompraFinaliza);

                compraFinaliza.setStatusCompra(Compra.FINALIZADA);
                Date dataEntrega = Calendar.getInstance().getTime();
                compraFinaliza.setDataEntrega(dataEntrega);

                //atualiza os estoques
                for (Item item : compraFinaliza.getItensCompra()) {
                    item.getProduto().setEstoqueAtual(item.getProduto().getEstoqueAtual() + item.getQuantidade());
                }
                daoCompra.update(compraFinaliza);

                response.sendRedirect("compraView.jsp?idCompra=" + compraFinaliza.getId());
                break;
            default:
                rd.forward(request, response);
        }
    }
}
