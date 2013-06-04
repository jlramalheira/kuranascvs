/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCompra;
import Dao.DaoItem;
import Dao.DaoProduto;
import Model.Compra;
import Model.Item;
import Model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Item", urlPatterns = {"/Item"})
public class ServletItem extends HttpServlet {
    DaoItem daoItem = new DaoItem();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");
        
        switch (operacao) {
            case "Cadastrar Compra":
                int idCompra = Integer.parseInt(request.getParameter("idCompra"));
                int idProduto = Integer.parseInt(request.getParameter("produto-id"));
                
                Compra compra = new DaoCompra().get(idCompra);
                Produto produto = new DaoProduto().get(idProduto);
                
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                System.out.println(request.getParameter("total"));
                double custo = Double.parseDouble(request.getParameter("total"));
                
                Item item = new Item(produto, quantidade,custo);
                daoItem.insert(item);
                
                compra.insertItem(item);
                
                new DaoCompra().update(compra);
                
                rd = request.getRequestDispatcher("compraView?idCompra="+compra.getId());
                rd.forward(request, response);
                break;
            default:
                rd.forward(request, response);
        }
    }

}
