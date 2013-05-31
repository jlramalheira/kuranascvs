/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Joao Luiz
 */
@Entity
public class OrdemDeServico implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataEmissao;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date previsaoConclusao;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataConclusao;
    private String descricao;
    @OneToOne
    private Cliente cliente;
    @OneToMany
    private List<Funcionario> funcionarios;
    @OneToMany
    private List<Produto> produtos;
    @OneToMany
    private List<Servico> servicos;
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrdemDeServico)) {
            return false;
        }
        OrdemDeServico other = (OrdemDeServico) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.OrdemDeServico[ id=" + id + " ]";
    }
    
}
