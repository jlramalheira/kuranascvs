/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoServico;
import Model.Servico;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Servico", urlPatterns = {"/Servico"})
public class ServletServico extends HttpServlet {

    DaoServico daoServico = new DaoServico();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "Pesquisar":
                String nome = request.getParameter("nome");
                double valor = -1;
                String descricao = request.getParameter("descricao");

                boolean ativo = true;
                if (request.getParameter("ativo") != null) {
                    ativo = Boolean.parseBoolean(request.getParameter("ativo"));
                }
                if (!request.getParameter("valor").isEmpty()){
                    valor = Double.parseDouble(request.getParameter("valor"));
                }

                List<Servico> servicos = null;
                if (ativo) {
                    if (valor > 0) {
                        servicos = daoServico.listByAll(nome, valor, descricao, ativo);
                    } else {
                        servicos = daoServico.listNomeDescricaoAtivo(nome, descricao, ativo);
                    }
                } else {
                    if (valor > 0) {
                        servicos = daoServico.listNomeValorDescricao(nome, valor, descricao);
                    } else {
                        servicos = daoServico.listNomeDescricao(nome, descricao);
                    }
                }

                session.setAttribute("servicos", servicos);

                rd = request.getRequestDispatcher("servicoSearch.jsp");
                rd.forward(request, response);
                break;
            case "Index" :
                rd = request.getRequestDispatcher("servicoSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo" :
                rd = request.getRequestDispatcher("servicoCreate.jsp");
                rd.forward(request, response);
                break;
            case "AdicionarItem":
                int idVenda = Integer.parseInt(request.getParameter("idVenda"));
                
                rd = request.getRequestDispatcher("itemVendaServicoCreate.jsp?idVenda="+idVenda);
                rd.forward(request, response);
                break;
            case "Ver" :
                int idServico = Integer.parseInt(request.getParameter("idServico"));
                
                rd = request.getRequestDispatcher("servicoView.jsp?idServico="+idServico);
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
                double valor = Double.parseDouble(request.getParameter("valor"));
                String descricao = request.getParameter("descricao");

                Servico servico = new Servico(nome, descricao, valor, true);
                daoServico.insert(servico);

                response.sendRedirect("Servico?operacao=Ver&idServico=" + servico.getId());
                break;
            default:
                rd.forward(request, response);

        }
    }
}
