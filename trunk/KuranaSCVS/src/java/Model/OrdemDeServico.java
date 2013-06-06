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

    public OrdemDeServico() {
    }

    public OrdemDeServico(Date dataEmissao, Date previsaoConclusao, Date dataConclusao, String descricao, Cliente cliente, List<Funcionario> funcionarios, List<Produto> produtos, List<Servico> servicos) {
        this.dataEmissao = dataEmissao;
        this.previsaoConclusao = previsaoConclusao;
        this.dataConclusao = dataConclusao;
        this.descricao = descricao;
        this.cliente = cliente;
        this.funcionarios = funcionarios;
        this.produtos = produtos;
        this.servicos = servicos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(Date dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public Date getPrevisaoConclusao() {
        return previsaoConclusao;
    }

    public void setPrevisaoConclusao(Date previsaoConclusao) {
        this.previsaoConclusao = previsaoConclusao;
    }

    public Date getDataConclusao() {
        return dataConclusao;
    }

    public void setDataConclusao(Date dataConclusao) {
        this.dataConclusao = dataConclusao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<Funcionario> getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(List<Funcionario> funcionarios) {
        this.funcionarios = funcionarios;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public List<Servico> getServicos() {
        return servicos;
    }

    public void setServicos(List<Servico> servicos) {
        this.servicos = servicos;
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
