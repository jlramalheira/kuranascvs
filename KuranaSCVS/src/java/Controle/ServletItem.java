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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");
        
        switch (operacao) {
            case "Editar Item":
                int idCompra = Integer.parseInt(request.getParameter("idCompra"));
                int idItem = Integer.parseInt(request.getParameter("idItem"));
                response.sendRedirect("itemCompraEdit.jsp?idCompra="+idCompra+"&idItem="+idItem);
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
            case "Cadastrar Compra":
                int idCompra = Integer.parseInt(request.getParameter("idCompra"));
                int idProduto = Integer.parseInt(request.getParameter("produto-id"));
                
                Compra compra = new DaoCompra().get(idCompra);
                Produto produto = new DaoProduto().get(idProduto);
                
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                double total = Double.parseDouble(request.getParameter("precoTotal"));
                
                double custo = total / quantidade;
                
                Item item = new Item(produto, quantidade,custo);
                daoItem.insert(item);
                
                compra.insertItem(item);
                
                new DaoCompra().update(compra);
                
                response.sendRedirect("compraView.jsp?idCompra="+compra.getId());
                break;
            case "Excluir Item":
                int idCompraExclui = Integer.parseInt(request.getParameter("idCompra"));
                int idItem = Integer.parseInt(request.getParameter("idItem"));
                
                Compra compraExclui = new DaoCompra().get(idCompraExclui);
                Item itemExclui = daoItem.get(idItem);
                
                compraExclui.getItensCompra().remove(itemExclui);
                
                daoItem.remove(idItem);
                
                response.sendRedirect("compraView.jsp?idCompra="+compraExclui.getId());
                break;
            case "Editar":
                int idCompraEditar = Integer.parseInt(request.getParameter("idCompra"));
                int idItemEditar = Integer.parseInt(request.getParameter("idItem"));
                int idProdutoEditar = Integer.parseInt(request.getParameter("produto-id"));
                
                Compra compraEditar = new DaoCompra().get(idCompraEditar);
                Produto produtoEditar = new DaoProduto().get(idProdutoEditar);
                Item itemEditar = daoItem.get(idItemEditar);
                
                compraEditar.getItensCompra().remove(itemEditar);
                
                int quantidadeEditar = Integer.parseInt(request.getParameter("quantidade"));
                double totalEditar = Double.parseDouble(request.getParameter("precoTotal"));                
                double custoEditar = totalEditar / quantidadeEditar;
                
                itemEditar.setProduto(produtoEditar);
                itemEditar.setQuantidade(quantidadeEditar);
                itemEditar.setValor(custoEditar);
                
                daoItem.update(itemEditar);
                compraEditar.getItensCompra().add(itemEditar);
                new DaoCompra().update(compraEditar);
                
                response.sendRedirect("compraView.jsp?idCompra="+idCompraEditar);
                
                break;
            case "Cancelar":
                int idCompraCancela = Integer.parseInt(request.getParameter("idCompra"));
                
                response.sendRedirect("compraView.jsp?idCompra="+idCompraCancela);
                break;
            default:
                rd.forward(request, response);
        }
    }

}