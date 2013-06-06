/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoEndereco;
import Dao.DaoFornecedor;
import Model.Endereco;
import Model.Fornecedor;
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
@WebServlet(name = "Fornecedor", urlPatterns = {"/Fornecedor"})
public class ServletFornecedor extends HttpServlet {

    DaoFornecedor daoFornecedor = new DaoFornecedor();

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
                String cnpj = request.getParameter("cnpj");
                ;
                String email = request.getParameter("email");
                String logradouro = request.getParameter("endereco-logradouro");
                String cidade = request.getParameter("endereco-cidade");
                String estado = request.getParameter("endereco-estado");

                List<Fornecedor> fornecedores = daoFornecedor.listByAll(nome, cnpj, email, logradouro, cidade, estado);
                session.setAttribute("fornecedores", fornecedores);

                rd = request.getRequestDispatcher("fornecedorSearch.jsp");
                rd.forward(request, response);
                break;
            case "Ver":
                int idFornecedor = Integer.parseInt(request.getParameter("ifFornecedor"));

                rd = request.getRequestDispatcher("forneedorView.jsp?idFornecedor=" + idFornecedor);
                rd.forward(request, response);
                break;
            case "Index":
                rd = request.getRequestDispatcher("fornecedorSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo":
                rd = request.getRequestDispatcher("fornecedorCreate.jsp");
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
                String cnpj = "";
                String telefone = "";
                String email = "";
                Endereco endereco = new Endereco("", "", -1, "", "", "");
                boolean insereEndereco = false; //caso o endereco seja fornecido, ele é persistido no banco
                if (!request.getParameter("cnpj").isEmpty()) {
                    cnpj = request.getParameter("cnpj");
                }
                if (!request.getParameter("email").isEmpty()) {
                    email = request.getParameter("email");
                }
                if (!request.getParameter("telefone").isEmpty()) {
                    telefone = request.getParameter("telefone");
                }
                if (!request.getParameter("endereco-cep").isEmpty()) {
                    endereco.setCep(request.getParameter("endereco-cep"));
                    insereEndereco = true;
                }
                if (!request.getParameter("endereco-logradouro").isEmpty()) {
                    endereco.setLogradouro(request.getParameter("endereco-logradouro"));
                    insereEndereco = true;
                }
                if (!request.getParameter("endereco-numero").isEmpty()) {
                    endereco.setNumero(Integer.parseInt(request.getParameter("endereco-numero")));
                    insereEndereco = true;
                }
                if (!request.getParameter("endereco-complemento").isEmpty()) {
                    endereco.setComplemento(request.getParameter("endereco-complemento"));
                    insereEndereco = true;
                }
                if (!request.getParameter("endereco-cidade").isEmpty()) {
                    endereco.setCidade(request.getParameter("endereco-cidade"));
                    insereEndereco = true;
                }
                if (!request.getParameter("endereco-estado").isEmpty()) {
                    endereco.setEstado(request.getParameter("endereco-estado"));
                    insereEndereco = true;
                }
                if (insereEndereco) {
                    new DaoEndereco().insert(endereco);
                    Fornecedor fornecedor = new Fornecedor(nome, cnpj, email, telefone, endereco);

                    daoFornecedor.insert(fornecedor);

                    response.sendRedirect("fornecedorView.jsp?idFornecedor=" + fornecedor.getId());
                } else { //inserido sem endereco
                    Endereco e = new DaoEndereco().get(1);
                    Fornecedor fornecedor = new Fornecedor(nome, cnpj, email, telefone, e);

                    daoFornecedor.insert(fornecedor);

                    response.sendRedirect("fornecedorView.jsp?idFornecedor=" + fornecedor.getId());
                }
                break;
            default:
                rd.forward(request, response);
        }
    }
}
