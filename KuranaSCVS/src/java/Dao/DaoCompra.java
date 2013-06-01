/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Compra;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoCompra extends Dao<Compra>{

    public DaoCompra() {
        super(Compra.class);
    }
    
    public List<Compra> listSimple(int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    
    public List<Compra> listByDataPedidoInicio(String dataPedidoInicio, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido > '"+dataPedidoInicio+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoFim(String dataPedidoFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido < '"+dataPedidoFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataEntregaInicio(String dataEntregaInicio, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido > '"+dataEntregaInicio+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataEntregaFim(String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido < '"+dataEntregaFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    
    public List<Compra> listByDataPedidoInicioFim(String dataPedidoInicio, String dataPedidoFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido BETWEEN '"+dataPedidoInicio+"' AND '"+dataPedidoFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataEntregaInicioFim(String dataEntregaInicio, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataEntrega BETWEEN '"+dataEntregaInicio+"' AND '"+dataEntregaFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }    
    public List<Compra> listByDataPedidoInicioEntregaInicio(String dataPedidoInicio, String dataEntregaInicio, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido > '"+dataPedidoInicio+"' AND e.dataEntrega > '"+dataEntregaInicio+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoInicioEntregaFim(String dataPedidoInicio, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido > '"+dataPedidoInicio+"' AND e.dataEntrega < '"+dataEntregaFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoFimEntregaInicio(String dataPedidoFim, String dataEntregaIncio, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido < '"+dataPedidoFim+"' AND e.dataEntrega > '"+dataEntregaIncio+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoFimEntregaFim(String dataPedidoFim, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido < '"+dataPedidoFim+"' AND e.dataEntrega < '"+dataEntregaFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    
    public List<Compra> listByDataPedidoFimEntregaIncioEntregaFim(String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido < '"+dataPedidoFim+"' AND (e.dataEntrega BETWEEN '"+dataEntregaInicio+"' AND '"+dataEntregaFim+"') OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoInicioEntregaIncioEntregaFim(String dataPedidoInicio, String dataEntregaInicio, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.dataPedido > '"+dataPedidoInicio+"' AND (e.dataEntrega BETWEEN '"+dataEntregaInicio+"' AND '"+dataEntregaFim+"') OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoInicioPedidoFimEntregaFim(String dataPedidoInicio, String dataPedidoFim, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE (e.dataPedido BETWEEN '"+dataPedidoInicio+"' AND '"+dataPedidoFim+"') AND e.dataEntrega < '"+dataEntregaFim+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    public List<Compra> listByDataPedidoInicioPedidoFimEntregaIncio(String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE (e.dataPedido BETWEEN '"+dataPedidoInicio+"' AND '"+dataPedidoFim+"') AND e.dataEntrega > '"+dataEntregaInicio+"' OR e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    
    public List<Compra> listByAll(String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim, int idFornecedor, int status){
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE (e.dataPedido BETWEEN '"+dataPedidoInicio+"' AND '"+dataPedidoFim+"') AND"
                + "(e.dataEntrega BETWEEN '"+dataEntregaInicio+"' AND '"+dataEntregaFim+"') OR "
                + "e.fornecedor.id = "+idFornecedor+" OR e.statusCompra = "+status).getResultList();
    }
    
}
