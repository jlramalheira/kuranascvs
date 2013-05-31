/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Fornecedor;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoFornecedor extends Dao<Fornecedor>{

    public DaoFornecedor() {
        super(Fornecedor.class);
    }
    
    public List<Fornecedor> listByAll(String nome, String cnpj, String email, String logradouro, String cidade, String estado) {
        return em.createQuery("SELECT e FROM Fornecedor e WHERE e.nome LIKE '%" + nome + "%' AND "
                + "e.email LIKE '%" + email + "%' AND "
                + "e.cnpj LIKE '%" + cnpj + "%' AND "
                + "e.endereco.logradouro LIKE '%"+logradouro+"%' AND "
                + "e.endereco.cidade LIKE '%"+cidade+"%' AND "
                + "e.endereco.estado LIKE '%"+estado+"%'").getResultList();
    }
}
