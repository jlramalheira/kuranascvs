/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Funcionario;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoFuncionario extends Dao<Funcionario>{

    public DaoFuncionario() {
        super(Funcionario.class);
    }
    
    public List<Funcionario> listByAll(String nome,String cpf, int cargo, String email, String telefone, String logradouro, String cidade, String estado){
        return em.createQuery("SELECT e FROM Funcionario e WHERE e.nome LIKE '%"+nome+"%' AND e.cpf LIKE '%"+cpf+"%' AND "
                + "e.email LIKE '%"+email+"%' AND e.telefone LIKE '%"+telefone+"%' AND e.endereco.logradouro LIKE '%"+logradouro+"%' AND "
                + "e.endereco.cidade LIKE '%"+cidade+"%' AND e.endereco.estado LIKE '%"+estado+"%' AND e.cargo = "+cargo).getResultList();
    }
    
    public List<Funcionario> listByAllMenosCargo(String nome,String cpf, String email, String telefone, String logradouro, String cidade, String estado){
        return em.createQuery("SELECT e FROM Funcionario e WHERE e.nome LIKE '%"+nome+"%' AND e.cpf LIKE '%"+cpf+"%' AND "
                + "e.email LIKE '%"+email+"%' AND e.telefone LIKE '%"+telefone+"%' AND e.endereco.logradouro LIKE '%"+logradouro+"%' AND "
                + "e.endereco.cidade LIKE '%"+cidade+"%' AND e.endereco.estado LIKE '%"+estado+"%'").getResultList();
    }
    
}
