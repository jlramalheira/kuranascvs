/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle;

import Dao.DaoEndereco;
import Dao.DaoFuncionario;
import Model.Endereco;
import Model.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author jota
 */
@WebServlet(name = "Funcionario", urlPatterns = {"/Funcionario"})
public class ServletFuncionario extends HttpServlet {

    DaoFuncionario daoFuncionario = new DaoFuncionario();

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
                String cpf = request.getParameter("cpf");
                int cargo = Integer.parseInt(request.getParameter("cargo"));
                String email = request.getParameter("email");
                String telefone = request.getParameter("telefone");
                String logradouro = request.getParameter("endereco-logradouro");
                String cidade = request.getParameter("endereco-cidade");
                String estado = request.getParameter("endereco-estado");

                List<Funcionario> funcionarios = null;
                if (cargo >= 0) {
                    funcionarios = daoFuncionario.listByAll(nome, cpf, cargo, email, telefone, logradouro, cidade, estado);
                } else {
                    funcionarios = daoFuncionario.listByAllMenosCargo(nome, cpf, email, telefone, logradouro, cidade, estado);

                }

                request.setAttribute("funcionarios", funcionarios);

                rd = request.getRequestDispatcher("funcionarioSearch.jsp");
                rd.forward(request, response);
                break;
            case "Index" :
                rd = request.getRequestDispatcher("funcionarioSearch.jsp");
                rd.forward(request, response);
                break;
            case "Novo" :
                rd = request.getRequestDispatcher("funcionarioCreate.jsp");
                rd.forward(request, response);
                break;
            case "Ver" :
                int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
                
                rd = request.getRequestDispatcher("funcionarioView.jsp?idFuncionario="+idFuncionario);
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
                String cpf = request.getParameter("cpf");
                Date dataNascimento = null;
                double salarioBase = Double.parseDouble(request.getParameter("salario-base"));
                String email = "";
                String telefone = "";

                List<Date> datasAdimissao = new ArrayList<Date>();
                List<Date> datasDemissao = new ArrayList<Date>();
                Date dataInsercao = Calendar.getInstance().getTime();
                datasAdimissao.add(dataInsercao);

                int cargo = Integer.parseInt(request.getParameter("cargo"));
                Endereco endereco = new Endereco("", "", -1, "", "", "");
                boolean insereEndereco = false; //caso o endereco seja fornecido, ele é persistido no banco

                if (!request.getParameter("data-nascimento").isEmpty()) {
                    String dataNasc = request.getParameter("data-nascimento");
                    dataNasc = dataNasc.substring(8) + "/" + dataNasc.substring(5, 7) + "/" + dataNasc.substring(0, 4);
                    dataNascimento = Util.Util.stringToDate(dataNasc);
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
                    Funcionario funcionario = new Funcionario(nome, cpf, telefone, endereco, cargo, email, dataNascimento, datasAdimissao, datasDemissao, salarioBase, true);

                    daoFuncionario.insert(funcionario);

                    response.sendRedirect("Funcionario?operacao=Ver&idFuncionario=" + funcionario.getId());
                } else { //inserido sem endereco
                    Endereco e = new DaoEndereco().get(1);
                    Funcionario funcionario = new Funcionario(nome, cpf, telefone, e, cargo, email, dataNascimento, datasAdimissao, datasDemissao, salarioBase, true);

                    daoFuncionario.insert(funcionario);
                    response.sendRedirect("Funcionario?operacao=VeridFuncionario=" + funcionario.getId());
                }

                break;
            case "Admitir":
                int idFuncionarioAdmitir = Integer.parseInt(request.getParameter("idFuncionario"));

                double novoSalario = 0;

                Funcionario funcionarioAdmitir = daoFuncionario.get(idFuncionarioAdmitir);

                if (!request.getParameter("salario-base").isEmpty()) {
                    novoSalario = Double.parseDouble(request.getParameter("salario-base"));
                    funcionarioAdmitir.setSalario(novoSalario);
                }


                funcionarioAdmitir.setContratado(true);
                Date dataAdmissao = Calendar.getInstance().getTime();
                funcionarioAdmitir.addAdmissao(dataAdmissao);


                daoFuncionario.update(funcionarioAdmitir);

                response.sendRedirect("Funcionario?operacao=Ver&idFuncionario=" + funcionarioAdmitir.getId());
                break;
            case "Demitir":
                int idFuncionarioDemitir = Integer.parseInt(request.getParameter("idFuncionario"));

                Funcionario funcionarioDemitir = daoFuncionario.get(idFuncionarioDemitir);

                funcionarioDemitir.setContratado(false);
                Date dataDemissao = Calendar.getInstance().getTime();
                funcionarioDemitir.addDemissao(dataDemissao);

                daoFuncionario.update(funcionarioDemitir);

                response.sendRedirect("Funcionario?operacao=Ver&idFuncionario=" + funcionarioDemitir.getId());
                break;
            default:
                rd.forward(request, response);
        }
    }
}
