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
                Endereco endereco = new Endereco();
                boolean insereEndereco = false; //caso o endereco seja fornecido, ele é persistido no banco
                if (request.getParameter("isJuridica") != null) {
                    if (!request.getParameter("cnpj").isEmpty()) {
                        identificacao = request.getParameter("cnpj");
                        juridica = true;
                    }
                } else {
                    if (!request.getParameter("cpf").isEmpty()) {
                        identificacao = request.getParameter("cpf");
                        juridica = false;
                    }
                }
                if (!request.getParameter("email").isEmpty()) {
                    email = request.getParameter("email");
                }
                if (!request.getParameter("telefone").isEmpty()) {
                    telefone = request.getParameter("telefone");
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
                } else { //inserido sem endereco
                    Cliente cliente = new Cliente(nome, identificacao, juridica, email, telefone, null, dataInsercao);

                    daoCliente.insert(cliente);
                }
                //rd = request.getRequestDispatcher("");
                rd.forward(request, response);
                break;
            default:
                rd.forward(request, response);
        }
    }
}
