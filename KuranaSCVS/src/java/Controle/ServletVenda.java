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
