/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoCliente;
import Dao.DaoEndereco;
import Model.Cliente;
import Model.Endereco;
import java.io.IOException;
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
@WebServlet(name = "Cliente", urlPatterns = {"/Cliente"})
public class ServletCliente extends HttpServlet {

    DaoCliente daoCliente = new DaoCliente();

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
                boolean juridica = false;
                String identificacao = "";
                String email = request.getParameter("email");
                String logradouro = request.getParameter("endereco-logradouro");
                String cidade = request.getParameter("endereco-cidade");
                String estado = request.getParameter("endereco-estado");
                if (request.getParameter("isJuridica") != null) {
                    juridica = true;
                    if (!request.getParameter("cnpj").isEmpty()) {
                        identificacao = request.getParameter("cnpj");
                    }
                } else {
                    if (!request.getParameter("cpf").isEmpty()) {
                        identificacao = request.getParameter("cpf");
                    }
                }
                List<Cliente> clientes = daoCliente.listByAll(nome, identificacao, juridica, email, logradouro, cidade, estado);
                session.setAttribute("clientes", clientes);

                rd = request.getRequestDispatcher("clienteSearch.jsp");
                rd.forward(request, response);
                break;
            case "Ver":
                int idCliente = Integer.parseInt(request.getParameter("idCliente"));

                rd = request.getRequestDispatcher("clienteView.jsp?idCliente=" + idCliente);
                rd.forward(request, response);
                break;
            case "Index":
                rd = request.getRequestDispatcher("clienteSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo":
                rd = request.getRequestDispatcher("clienteCreate.jsp");
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
                boolean juridica = false;
                String identificacao = "";
                String email = "";
                String telefone = "";
                Date dataInsercao = Calendar.getInstance().getTime();
                Endereco endereco = new Endereco("", "", -1, "", "", "");
                boolean insereEndereco = false; //caso o endereco seja fornecido, ele é persistido no banco
                if (request.getParameter("isJuridica") != null) {
                    juridica = true;
                    if (!request.getParameter("cnpj").isEmpty()) {
                        identificacao = request.getParameter("cnpj");
                    }
                } else {
                    if (!request.getParameter("cpf").isEmpty()) {
                        identificacao = request.getParameter("cpf");
                    }
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
                    Cliente cliente = new Cliente(nome, identificacao, juridica, email, telefone, endereco, dataInsercao);

                    daoCliente.insert(cliente);

                    response.sendRedirect("Cliente?operacao=Ver&idCliente=" + cliente.getId());
                } else { //inserido sem endereco
                    Endereco e = new DaoEndereco().get(1);
                    Cliente cliente = new Cliente(nome, identificacao, juridica, email, telefone, e, dataInsercao);

                    daoCliente.insert(cliente);

                    response.sendRedirect("Cliente?operacao=Ver&idCliente=" + cliente.getId());
                }

                break;
            default:
                rd.forward(request, response);
        }
    }
}
