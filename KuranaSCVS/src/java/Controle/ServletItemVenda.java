/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoItem;
import Dao.DaoProduto;
import Dao.DaoVenda;
import Model.Item;
import Model.Produto;
import Model.Venda;
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
 * @author Joao Luiz
 */
@WebServlet(name = "ItemVenda", urlPatterns = {"/ItemVenda"})
public class ServletItemVenda extends HttpServlet {

    DaoItem daoItem = new DaoItem();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");
        
        switch (operacao) {
            case "Editar":
                int idVenda = Integer.parseInt(request.getParameter("idVenda"));
                int idItem = Integer.parseInt(request.getParameter("idItem"));
                response.sendRedirect("itemVendaEdit.jsp?idVenda="+idVenda+"&idItem="+idItem);
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
            case "Adicionar":
                int idVenda = Integer.parseInt(request.getParameter("idVenda"));
                int idProduto = Integer.parseInt(request.getParameter("produto-id"));

                Venda venda = new DaoVenda().get(idVenda);
                Produto produto = new DaoProduto().get(idProduto);

                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                double total = Double.parseDouble(request.getParameter("precoTotal"));

                double custo = total / quantidade;

                produto.setEstoqueAtual(produto.getEstoqueAtual() - quantidade);

                new DaoProduto().update(produto);

                Item item = new Item(produto, null, quantidade, custo);
                daoItem.insert(item);

                venda.insertItemVenda(item);

                new DaoVenda().update(venda);

                response.sendRedirect("vendaView.jsp?idVenda=" + venda.getId());
                break;
            case "Excluir":
                int idVendaExclui = Integer.parseInt(request.getParameter("idVenda"));
                int idItem = Integer.parseInt(request.getParameter("idItem"));

                Venda vendaExclui = new DaoVenda().get(idVendaExclui);
                Item itemExclui = daoItem.get(idItem);

                Produto produtoAltera = itemExclui.getProduto();
                produtoAltera.setEstoqueAtual(produtoAltera.getEstoqueAtual() + itemExclui.getQuantidade());

                new DaoProduto().update(produtoAltera);

                vendaExclui.getItensVenda().remove(itemExclui);

                daoItem.remove(idItem);

                response.sendRedirect("vendaView.jsp?idVenda=" + vendaExclui.getId());
                break;
            case "Editar":
                int idVendaEditar = Integer.parseInt(request.getParameter("idVenda"));
                int idItemEditar = Integer.parseInt(request.getParameter("idItem"));
                int idProdutoEditar = Integer.parseInt(request.getParameter("produto-id"));

                Venda vendaEditar = new DaoVenda().get(idVendaEditar);
                Produto produtoEditar = new DaoProduto().get(idProdutoEditar);
                Item itemEditar = daoItem.get(idItemEditar);

                vendaEditar.getItensVenda().remove(itemEditar);

                int quantidadeEditar = Integer.parseInt(request.getParameter("quantidade"));
                double totalEditar = Double.parseDouble(request.getParameter("precoTotal"));
                double custoEditar = totalEditar / quantidadeEditar;

                if (quantidadeEditar != itemEditar.getQuantidade()) {
                    int qtde = quantidadeEditar - itemEditar.getQuantidade();
                    produtoEditar.setEstoqueAtual(produtoEditar.getEstoqueAtual() + qtde);
                }
                itemEditar.setProduto(produtoEditar);
                itemEditar.setQuantidade(quantidadeEditar);
                itemEditar.setValor(custoEditar);

                daoItem.update(itemEditar);
                vendaEditar.getItensVenda().add(itemEditar);
                new DaoVenda().update(vendaEditar);

                response.sendRedirect("vendaView.jsp?idVenda=" + idVendaEditar);

                break;
            case "Cancelar":
                int idVendaCancela = Integer.parseInt(request.getParameter("idVenda"));

                response.sendRedirect("vendaView.jsp?idVenda=" + idVendaCancela);
                break;
            default:
                rd.forward(request, response);
        }
    }
}
