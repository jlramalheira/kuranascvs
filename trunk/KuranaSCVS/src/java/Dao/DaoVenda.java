/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Venda;
import java.util.List;

/**
 *
 * @author Joao Luiz
 */
public class DaoVenda extends Dao<Venda> {

    public DaoVenda() {
        super(Venda.class);
    }
    //vendaSearch

    public List<Venda> listByCliente(String cliente) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%'").getResultList();
    }

    public List<Venda> listSimple(String cliente, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioStatus(String cliente, String dataPedidoInicio, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicio(String cliente, String dataPedidoInicio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "'").getResultList();
    }

    public List<Venda> listByDataPedidoFimStatus(String cliente, String dataPedidoFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoFim(String cliente, String dataPedidoFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "'").getResultList();
    }

    public List<Venda> listByDataEntregaInicioStatus(String cliente, String dataEntregaInicio, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataEntregaInicio + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataEntregaInicio(String cliente, String dataEntregaInicio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataEntregaInicio + "'").getResultList();
    }

    public List<Venda> listByDataEntregaFimStatus(String cliente, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataEntregaFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataEntregaFim(String cliente, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataEntregaFim + "'").getResultList();
    }

    public List<Venda> listByDataPedidoInicioFimStatus(String cliente, String dataPedidoInicio, String dataPedidoFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioFim(String cliente, String dataPedidoInicio, String dataPedidoFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "'").getResultList();
    }

    public List<Venda> listByDataEntregaInicioFimStatus(String cliente, String dataEntregaInicio, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataEntregaInicioFim(String cliente, String dataEntregaInicio, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "' ").getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaInicioStatus(String cliente, String dataPedidoInicio, String dataEntregaInicio, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND e.dataEntrega > '" + dataEntregaInicio + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaInicio(String cliente, String dataPedidoInicio, String dataEntregaInicio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND e.dataEntrega > '" + dataEntregaInicio + "'").getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaFimStatus(String cliente, String dataPedidoInicio, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND e.dataEntrega < '" + dataEntregaFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaFim(String cliente, String dataPedidoInicio, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND e.dataEntrega < '" + dataEntregaFim + "'").getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaInicioStatus(String cliente, String dataPedidoFim, String dataEntregaIncio, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND e.dataEntrega > '" + dataEntregaIncio + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaInicio(String cliente, String dataPedidoFim, String dataEntregaIncio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND e.dataEntrega > '" + dataEntregaIncio + "'").getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaFimStatus(String cliente, String dataPedidoFim, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND e.dataEntrega < '" + dataEntregaFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaFim(String cliente, String dataPedidoFim, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND e.dataEntrega < '" + dataEntregaFim + "'").getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaIncioEntregaFimStatus(String cliente, String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND (e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoFimEntregaIncioEntregaFim(String cliente, String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido < '" + dataPedidoFim + "' AND (e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') ").getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaIncioEntregaFimStatus(String cliente, String dataPedidoInicio, String dataEntregaInicio, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND (e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioEntregaIncioEntregaFim(String cliente, String dataPedidoInicio, String dataEntregaInicio, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND e.dataPedido > '" + dataPedidoInicio + "' AND (e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') ").getResultList();
    }

    public List<Venda> listByDataPedidoInicioPedidoFimEntregaFimStatus(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND e.dataEntrega < '" + dataEntregaFim + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioPedidoFimEntregaFim(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND e.dataEntrega < '" + dataEntregaFim + "'").getResultList();
    }

    public List<Venda> listByDataPedidoInicioPedidoFimEntregaIncioStatus(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND e.dataEntrega > '" + dataEntregaInicio + "' AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByDataPedidoInicioPedidoFimEntregaIncio(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND e.dataEntrega > '" + dataEntregaInicio + "' ").getResultList();
    }

    public List<Venda> listByAll(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim, int status) {
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND"
                + "(e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') AND e.statusVenda = " + status).getResultList();
    }

    public List<Venda> listByAllMenosStatus(String cliente, String dataPedidoInicio, String dataPedidoFim, String dataEntregaInicio, String dataEntregaFim) {
        return em.createQuery("SELECT DISTINCT e FROM Compra e WHERE e.cliente.nome LIKE '%" + cliente + "%' AND (e.dataPedido BETWEEN '" + dataPedidoInicio + "' AND '" + dataPedidoFim + "') AND"
                + "(e.dataEntrega BETWEEN '" + dataEntregaInicio + "' AND '" + dataEntregaFim + "') ").getResultList();
    }

    //Relatorios
    public List<Venda> listByPeriodoInicioFim(String dataInicio, String dataFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE e.dataPedido BETWEEN '" + dataInicio + "' AND '" + dataFim + "'").getResultList();
    }

    public List<Venda> listByPeriodoInicio(String dataInicio) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE AND e.dataPedido > '" + dataInicio + "'").getResultList();
    }

    public List<Venda> listByPeriodoFim(String dataFim) {
        return em.createQuery("SELECT DISTINCT e FROM Venda e WHERE AND e.dataPedido < '" + dataFim + "'").getResultList();
    }
}
