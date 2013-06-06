/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCliente;
import Dao.DaoVenda;
import Model.Cliente;
import Model.Item;
import Model.Venda;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Venda", urlPatterns = {"/Venda"})
public class ServletVenda extends HttpServlet {

    DaoVenda daoVenda = new DaoVenda();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");
        switch (operacao) {
            case "Index" :
                rd = request.getRequestDispatcher("vendaSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo" :
                rd = request.getRequestDispatcher("vendaCreate.jsp");
                rd.forward(request, response);
                break;
            case "Ver" :
                int idVenda = Integer.parseInt(request.getParameter("idVenda"));
                rd = request.getRequestDispatcher("vendaView.jsp?idVenda="+idVenda);
                rd.forward(request, response);
                break;
            case "Pesquisar" :
                
                String cliente = request.getParameter("cliente");
                
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
                
                int status = -1;
                if (request.getParameter("status") != null){
                    status = Integer.parseInt(request.getParameter("status"));
                }
                List<Venda> vendas = null;
                if (status > 0){
                    if (dataPedidoInicio != null){
                        if (dataPedidoFim != null){
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByAll(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaInicio, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioPedidoFimEntregaIncioStatus(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaInicio, status);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioPedidoFimEntregaFimStatus(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioFimStatus(cliente, dataPedidoInicio, dataPedidoFim, status);
                                }
                            }
                        } else {
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioEntregaIncioEntregaFimStatus(cliente, dataPedidoInicio, dataEntregaInicio, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioEntregaInicioStatus(cliente, dataPedidoInicio, dataEntregaInicio, status);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioEntregaFimStatus(cliente, dataPedidoInicio, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioStatus(cliente, dataPedidoInicio, status);
                                }
                            }
                        }
                    } else {
                        if (dataPedidoFim != null){
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoFimEntregaIncioEntregaFimStatus(cliente, dataPedidoFim, dataEntregaInicio, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataPedidoFimEntregaInicioStatus(cliente, dataPedidoFim, dataEntregaInicio, status);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoFimEntregaFimStatus(cliente, dataPedidoFim, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataEntregaFimStatus(cliente, dataEntregaFim, status);
                                }
                            }
                        } else {
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataEntregaInicioFimStatus(cliente, dataEntregaInicio, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listByDataEntregaInicioStatus(cliente, dataEntregaInicio, status);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataEntregaFimStatus(cliente, dataEntregaFim, status);
                                } else {
                                    vendas = daoVenda.listSimple(cliente, status);
                                }
                            }
                        }
                    }
                } else {
                    if (dataPedidoInicio != null){
                        if (dataPedidoFim != null){
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByAllMenosStatus(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaInicio, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioPedidoFimEntregaIncio(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaInicio);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioPedidoFimEntregaFim(cliente, dataPedidoInicio, dataPedidoFim, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioFim(cliente, dataPedidoInicio, dataPedidoFim);
                                }
                            }
                        } else {
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioEntregaIncioEntregaFim(cliente, dataPedidoInicio, dataEntregaInicio, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicioEntregaInicio(cliente, dataPedidoInicio, dataEntregaInicio);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoInicioEntregaFim(cliente, dataPedidoInicio, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataPedidoInicio(cliente, dataPedidoInicio);
                                }
                            }
                        }
                    } else {
                        if (dataPedidoFim != null){
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoFimEntregaIncioEntregaFim(cliente, dataPedidoFim, dataEntregaInicio, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataPedidoFimEntregaInicio(cliente, dataPedidoFim, dataEntregaInicio);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataPedidoFimEntregaFim(cliente, dataPedidoFim, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataEntregaFim(cliente, dataEntregaFim);
                                }
                            }
                        } else {
                            if (dataEntregaInicio != null){
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataEntregaInicioFim(cliente, dataEntregaInicio, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByDataEntregaInicio(cliente, dataEntregaInicio);
                                }
                            } else {
                                if (dataEntregaFim != null){
                                    vendas = daoVenda.listByDataEntregaFim(cliente, dataEntregaFim);
                                } else {
                                    vendas = daoVenda.listByCliente(cliente);
                                }
                            }
                        }
                    }
                }
                
                session.setAttribute("vendas", vendas);
                
                rd = request.getRequestDispatcher("vendaSearch.jsp");
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
                String clienteStr = request.getParameter("cliente");

                if (!clienteStr.isEmpty()){
                    int idCliente = Integer.parseInt(clienteStr.split(" - ")[0]);

                    Cliente cliente = new DaoCliente().get(idCliente);
                    Date dataVenda = Calendar.getInstance().getTime();
                    List<Item> itensVenda = new ArrayList<Item>();
                    List<Item> itensServico = new ArrayList<Item>();

                    Venda venda = new Venda(dataVenda, null, cliente, Venda.ANDAMENTO, itensVenda);

                    daoVenda.insert(venda);

                    response.sendRedirect("vendaView.jsp?idVenda="+venda.getId());
                } else {
                    rd.forward(request, response);
                }
                break;
            case "Cancelar":
                int idVendaCancelar = Integer.parseInt(request.getParameter("idVenda"));

                Venda vendaCancelar = daoVenda.get(idVendaCancelar);

                vendaCancelar.setStatusVenda(Venda.CANCELADA);

                daoVenda.update(vendaCancelar);

                response.sendRedirect("vendaView.jsp?idVenda="+idVendaCancelar);
                break;

            case "Finalizar":
                int idVendaFinalizar = Integer.parseInt(request.getParameter("idVenda"));

                Venda vendaFinalizar = daoVenda.get(idVendaFinalizar);

                vendaFinalizar.setStatusVenda(Venda.FINALIZADA);
                Date dataEntrega = Calendar.getInstance().getTime();
                vendaFinalizar.setDataEntrega(dataEntrega);
                daoVenda.update(vendaFinalizar);

                response.sendRedirect("vendaView.jsp?idVenda="+idVendaFinalizar);
                break;
            default:
                rd.forward(request, response);
        }
    }
}
