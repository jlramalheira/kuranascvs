/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCompra;
import Dao.DaoFornecedor;
import Model.Compra;
import Model.Fornecedor;
import java.io.IOException;
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
                Compra compra = new Compra(dataCompra, null, fornecedor, Compra.ANDAMENTO, null);
                
                daoCompra.insert(compra);
                
                rd = request.getRequestDispatcher("compraView.jsp?idCompra="+compra.getId());
                rd.forward(request, response);
                break;
            default:
                rd.forward(request, response);
        }
    }

}
