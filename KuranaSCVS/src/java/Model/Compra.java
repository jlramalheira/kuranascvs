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
public class Compra implements Serializable {
    public static final int ANDAMENTO = 0;
    public static final int FINALIZADA = 1;
    public static final int CANCELADA = 2;
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataPedido;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataEntrega;
    @OneToOne
    private Fornecedor fornecedor;
    private int statusCompra;
    @OneToMany
    private List<Item> itensCompra;

    public Compra() {
    }

    public Compra(Date dataPedido, Date dataEntrega, Fornecedor fornecedor, int statusCompra, List<Item> itensCompra) {
        this.dataPedido = dataPedido;
        this.dataEntrega = dataEntrega;
        this.fornecedor = fornecedor;
        this.statusCompra = statusCompra;
        this.itensCompra = itensCompra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    public Date getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Date dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public int getStatusCompra() {
        return statusCompra;
    }

    public void setStatusCompra(int statusCompra) {
        this.statusCompra = statusCompra;
    }

    public List<Item> getItensCompra() {
        return itensCompra;
    }

    public void setItensCompra(List<Item> itensCompra) {
        this.itensCompra = itensCompra;
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
        if (!(object instanceof Compra)) {
            return false;
        }
        Compra other = (Compra) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Compra[ id=" + id + " ]";
    }
    
}
