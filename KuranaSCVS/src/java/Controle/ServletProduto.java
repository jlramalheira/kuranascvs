/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoFornecedor;
import Dao.DaoProduto;
import Model.Fornecedor;
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
 * @author Joao Luiz
 */
@WebServlet(name = "Produto", urlPatterns = {"/Produto"})
public class ServletProduto extends HttpServlet {
    
    DaoProduto daoProduto = new DaoProduto();
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
            case "Cadastrar":
                String nome = request.getParameter("nome");
                String codigoDeBarras = "";
                int idFornecedor = Integer.parseInt(request.getParameter("fornecedor"));
                double valorCusto = 0;
                double valorVenda = 0;
                int estoqueMinimo = 0;
                if (!request.getParameter("codigo-barras").isEmpty()) {
                    codigoDeBarras = request.getParameter("codigo-barras");
                }
                if (!request.getParameter("valor-custo").isEmpty()) {
                    valorCusto = Double.parseDouble(request.getParameter("valor-custo"));
                }
                if (!request.getParameter("valor-venda").isEmpty()) {
                    valorVenda = Double.parseDouble(request.getParameter("valor-venda"));
                }
                if (!request.getParameter("estoque-minimo").isEmpty()) {
                    estoqueMinimo = Integer.parseInt(request.getParameter("estoque-minimo"));
                }
                
                Fornecedor fornecedor = new DaoFornecedor().get(idFornecedor);
                
                Produto produto = new Produto(nome, codigoDeBarras, fornecedor, valorCusto, valorVenda, estoqueMinimo);
                daoProduto.insert(produto);
                
                rd = request.getRequestDispatcher("produtoSearch.jsp");
                rd.forward(request, response);
                break;
            default:
                rd.forward(request, response);
        }
    }
}