/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Cliente;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoCliente extends Dao<Cliente> {

    public DaoCliente() {
        super(Cliente.class);
    }

    public List<Cliente> listByAll(String nome, String identificacao, boolean juridica, String email, String logradouro, String cidade, String estado) {
        return em.createQuery("SELECT e FROM Cliente e WHERE e.nome LIKE '%" + nome + "%' AND "
                + "e.email LIKE '%" + email + "%' AND "
                + "e.identificacao LIKE '%" + identificacao + "%' AND "
                + "e.juridica = "+juridica+" AND "
                + "e.endereco.logradouro LIKE '%"+logradouro+"%' AND "
                + "e.endereco.cidade LIKE '%"+cidade+"%' AND "
                + "e.endereco.estado LIKE '%"+estado+"%'").getResultList();
    }
}
