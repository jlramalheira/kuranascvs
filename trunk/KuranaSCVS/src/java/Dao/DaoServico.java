/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Servico;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoServico extends Dao<Servico>{

    public DaoServico() {
        super(Servico.class);
    }
    
    public List<Servico> listNomeDescricao(String nome, String descricao){
        return em.createQuery("SELECT e FROM Servico e WHERE e.nome LIKE '%"+nome+"%' AND e.descricao LIKE '%"+descricao+"%'").getResultList();
    }
    
    public List<Servico> listNomeDescricaoAtivo(String nome, String descricao, boolean ativo){
        return em.createQuery("SELECT e FROM Servico e WHERE e.nome LIKE '%"+nome+"%' AND e.descricao LIKE '%"+descricao+"%' AND e.ativo = "+ativo).getResultList();
    }
    
    public List<Servico> listNomeValorDescricao(String nome, double valor, String descricao){
        return em.createQuery("SELECT e FROM Servico e WHERE e.nome LIKE '%"+nome+"%' AND e.valor = "+valor+" AND e.descricao LIKE '%"+descricao+"%'").getResultList();
    }
    
    public List<Servico> listByAll(String nome, double valor, String descricao, boolean ativo){
        return em.createQuery("SELECT e FROM Servico e WHERE e.nome LIKE '%"+nome+"%' AND e.valor = "+valor+" AND e.descricao LIKE '%"+descricao+"%' AND e.ativo = "+ativo).getResultList();
    }
}
