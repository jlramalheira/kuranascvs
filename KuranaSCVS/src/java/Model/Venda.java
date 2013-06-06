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
public class Venda implements Serializable {
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
    private Cliente cliente;
    private int statusVenda;
    @OneToMany
    private List<Item> itensVenda;

    public Venda() {
    }

    public Venda(Date dataPedido, Date dataEntrega, Cliente cliente, int statusVenda, List<Item> itensVenda) {
        this.dataPedido = dataPedido;
        this.dataEntrega = dataEntrega;
        this.cliente = cliente;
        this.statusVenda = statusVenda;
        this.itensVenda = itensVenda;
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

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public int getStatusVenda() {
        return statusVenda;
    }

    public void setStatusVenda(int statusVenda) {
        this.statusVenda = statusVenda;
    }

    public List<Item> getItensVenda() {
        return itensVenda;
    }

    public void setItensVenda(List<Item> itensVenda) {
        this.itensVenda = itensVenda;
    }

    
    //metodos de auxilio
    public double getSomaValoresItensVenda(){
        double soma = 0;
        for (Item item : this.itensVenda){
            soma += item.getValorTotal();
        }
        return soma;
    }
    
    public double getSomaQuantidadeItensVenda(){
        double soma = 0;
        for (Item item : this.itensVenda){
            soma += item.getQuantidade();
        }
        return soma;
    }
    
    public void insertItemVenda(Item item){
        this.itensVenda.add(item);
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
        if (!(object instanceof Venda)) {
            return false;
        }
        Venda other = (Venda) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Venda[ id=" + id + " ]";
    }
    
}
