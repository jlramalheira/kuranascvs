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
@WebServlet(name = "Produto", urlPatterns = {"/Produto"})
public class ServletProduto extends HttpServlet {

    DaoProduto daoProduto = new DaoProduto();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");

        switch (operacao){
            case "Ver":
                int idProduto = Integer.parseInt(request.getParameter("idProduto"));

                rd = request.getRequestDispatcher("produtoView.jsp?idProduto="+idProduto);
                rd.forward(request, response);
                break;
            case "Pesquisar":
                String nome = request.getParameter("nome");
                String codigoDeBarras = request.getParameter("codigo-barras");
                int idFornecedor = Integer.parseInt(request.getParameter("fornecedor"));

                List<Produto> produtos = daoProduto.listByNomeCodBarrasIdFornecedor(nome, codigoDeBarras, idFornecedor);

                session.setAttribute("produtos", produtos);
                rd = request.getRequestDispatcher("produtoSearch.jsp");
                rd.forward(request, response);
                break;
            case "AdicionarItemVenda":
                int idVenda = Integer.parseInt(request.getParameter("idVenda"));
                
                rd = request.getRequestDispatcher("itemVendaCreate.jsp?idVenda="+idVenda);
                rd.forward(request, response);
                break;
            case "AdicionarItemCompra":
                int idCompra = Integer.parseInt(request.getParameter("idCompra"));
                
                rd = request.getRequestDispatcher("itemCompraCreate.jsp?idVenda="+idCompra);
                rd.forward(request, response);
                break;
            case "Index":
                rd = request.getRequestDispatcher("produtoSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo":
                rd = request.getRequestDispatcher("produtoCreate.jsp");
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

                Produto produto = new Produto(nome, codigoDeBarras, fornecedor, valorCusto, valorVenda, estoqueMinimo,0);
                daoProduto.insert(produto);

                response.sendRedirect("Produto?operacao=Ver&idProduto="+produto.getId());
                break;
            default:
                rd.forward(request, response);
        }
    }
}
