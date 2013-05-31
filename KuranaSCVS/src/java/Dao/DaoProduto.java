/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Produto;
import java.util.List;

/**
 *
 * @author jota
 */
public class DaoProduto extends Dao<Produto>{

    public DaoProduto() {
        super(Produto.class);
    }
    
    public List<Produto> listByNomeCodBarrasIdFornecedor(String nome, String codigoDeBarras, int idFornecedor) {
        return em.createQuery("SELECT DISTINCT e FROM Produto e WHERE (e.nome LIKE '%" + nome + "%' AND "
                + "e.codigoDeBarras LIKE '%" + codigoDeBarras + "%') OR "
                + "e.fornecedor.id = " + idFornecedor).getResultList();
    }
    
    public List<Produto> listByFornecedor(int idFornecedor){
        return em.createQuery("SELECT e FROM Produto e WHERE e.fornecedor.id="+idFornecedor).getResultList();
    }
    
}
