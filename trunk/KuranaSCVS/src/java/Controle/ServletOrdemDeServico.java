/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCliente;
import Dao.DaoOrdemDeServico;
import Model.Cliente;
import Model.OrdemDeServico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jota
 */
@WebServlet(name = "OrdemDeServico", urlPatterns = {"/OrdemDeServico"})
public class ServletOrdemDeServico extends HttpServlet {

    DaoOrdemDeServico daoOrdemDeServico = new DaoOrdemDeServico();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "Ver":
                int idOrdem = Integer.parseInt(request.getParameter("idOrdem"));

                rd = request.getRequestDispatcher("ordemView.jsp?idOrdem=" + idOrdem);
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

                if (!clienteStr.isEmpty()) {
                    int idCliente = Integer.parseInt(clienteStr.split(" - ")[0]);

                    Cliente cliente = new DaoCliente().get(idCliente);
                    Date dataEmissao = Calendar.getInstance().getTime();
                    String dataPrevisaoStr = request.getParameter("previsao");
                    dataPrevisaoStr = dataPrevisaoStr.substring(8) + "/" + dataPrevisaoStr.substring(5, 7) + "/" + dataPrevisaoStr.substring(0, 4);
                    Date dataPrevissao = Util.Util.stringToDate(dataPrevisaoStr);

                    String descricao = request.getParameter("descricao");

                    OrdemDeServico ordem = new OrdemDeServico(dataEmissao, dataPrevissao, null, descricao, cliente, null, null, null, OrdemDeServico.ANDAMENTO);

                    daoOrdemDeServico.insert(ordem);

                    response.sendRedirect("OrdemDeServico?operacao=Ver&idOrdem=" + ordem.getId());
                } else {
                    rd.forward(request, response);
                }

                break;
            case "Finalizar":
                int idOrdemFinalizar = Integer.parseInt(request.getParameter("idOrdem"));
                
                OrdemDeServico ordemFinalizar = daoOrdemDeServico.get(idOrdemFinalizar);
                Date dataFinalizar = Calendar.getInstance().getTime();
                ordemFinalizar.setDataConclusao(dataFinalizar);
                ordemFinalizar.setStatusOrdem(OrdemDeServico.FINALIZADA);
                
                daoOrdemDeServico.update(ordemFinalizar);
                response.sendRedirect("OrdemDeServico?operacao=Ver&idOrdem=" + ordemFinalizar.getId());
                break;
            case "Cancelar":
                int idOrdemCancelar = Integer.parseInt(request.getParameter("idOrdem"));
                
                OrdemDeServico ordemCancelar = daoOrdemDeServico.get(idOrdemCancelar);
                
                ordemCancelar.setStatusOrdem(OrdemDeServico.CANCELADA);
                
                daoOrdemDeServico.update(ordemCancelar);
                response.sendRedirect("OrdemDeServico?operacao=Ver&idOrdem=" + ordemCancelar.getId());
                break;
            default:
                rd.forward(request, response);
        }
    }
}
