/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Dao.DaoCliente;
import Dao.DaoEndereco;
import Dao.DaoFornecedor;
import Dao.DaoFuncionario;
import Dao.DaoProduto;
import Model.Cliente;
import Model.Endereco;
import Model.Fornecedor;
import Model.Funcionario;
import Model.Produto;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.Cache;

/**
 *
 * @author Joao Luiz
 */
public class InitDB {

    public static void main(String[] args) {
        Endereco endereco = new Endereco("", "", -1, "", "", "");
        Endereco endereco1 = new Endereco("87456-010", "Rua da Forca", 789, "Apto. 10", "Maringá", "PR");
        Endereco endereco2 = new Endereco("65125-020", "Rua Petrocochino", 23, "", "Maringá", "PR");
        Endereco endereco3 = new Endereco("84562-030", "Rua do Sabão", 145, "Apto. 15", "Maringá", "PR");
        Endereco endereco4 = new Endereco("89650-040", "Av. das Sete Chaves", 1265, "", "Campo Mourão", "PR");
        Endereco endereco5 = new Endereco("87455-050", "Av. Primeiro", 4587, "", "São Paulo", "SP");
        Endereco endereco6 = new Endereco("85460-060", "Av. da Lama", 4587, "", "Campo Mourão", "PR");
        Endereco endereco7 = new Endereco("65875-070", "Rua do Sabão", 4587, "", "Campo Mourão", "PR");
        Endereco endereco8 = new Endereco("85658-080", "Av. Paulista", 4587, "", "Campo Mourão", "PR");
        Endereco endereco9 = new Endereco("96548-090", "Travessa ", 4587, "", "Araruna", "PR");
        Endereco endereco10 = new Endereco("32145-100", "Av. Capitão", 4587, "", "Peabiru", "PR");
        Endereco endereco11 = new Endereco("69854-110", "Av. Brasil", 4587, "", "Campo Mourão", "PR");
        Endereco endereco12 = new Endereco("96525-120", "Rua do Sapo", 4587, "", "Campo Mourão", "PR");
        
        new DaoEndereco().insert(endereco);
        new DaoEndereco().insert(endereco1);
        new DaoEndereco().insert(endereco2);
        new DaoEndereco().insert(endereco3);
        new DaoEndereco().insert(endereco4);
        new DaoEndereco().insert(endereco5);
        new DaoEndereco().insert(endereco6);
        new DaoEndereco().insert(endereco7);
        new DaoEndereco().insert(endereco8);
        new DaoEndereco().insert(endereco9);
        new DaoEndereco().insert(endereco10);
        new DaoEndereco().insert(endereco11);
        new DaoEndereco().insert(endereco12);
        
        
        Date data1 = new Date(2013-1900, 01, 02);
        Date data2 = new Date(2013-1900, 01, 29);
        Date data3 = new Date(2013-1900, 01, 28);
        Date data4 = new Date(2013-1900, 01, 04);
        Date data5 = new Date(2013-1900, 02, 05);
        Date data6 = new Date(2008-1900, 01, 01);
        Date data7 = new Date(2011-1900, 07, 11);
        Date data8 = new Date(2013-1900, 01, 01);
        Date data9 = new Date(2012-1900, 02, 03);
        Date data11 = new Date(2010-1900, 02, 18);
        Date data12 = new Date(2012-1900, 10, 07);
        Date data13 = new Date(2012-1900, 07, 27);
        Date data14 = new Date(2009-1900, 03, 24);
        Date data15 = new Date(2010-1900, 12, 26);
        Date data16 = new Date(1987-1900, 12, 15);
        Date data17 = new Date(1977-1900, 04, 10);
        Date data18 = new Date(1990-1900, 03, 24);
        Date data19 = new Date(1965-1900, 04, 20);
        
        Cliente cliente1 = new Cliente("Peta Perpétua", "145.632.754-12", false, "peta.perp@email.com" , "(44) 4652-4658", endereco1, data1);
        Cliente cliente2 = new Cliente("Pedremildo Escavadeira", "125.456.658-11", false, "pedre1000do@email.com" , "(44) 3423-7845", endereco2, data2);
        Cliente cliente3 = new Cliente("Anfilófio Neves", "298.452.112-98", false, "anfiNeves@email.com" , "(44) 6548-2985", endereco3, data3);
        
        new DaoCliente().insert(cliente1);
        new DaoCliente().insert(cliente2);
        new DaoCliente().insert(cliente3);
        
        Fornecedor fornecedor1 = new Fornecedor("Ete informatica", "23.965.734/0001-45", "contato@ete.com", "(44) 1236-4576", endereco4);
        Fornecedor fornecedor2 = new Fornecedor("Consoft informática", "65.458.943/0001-66", "contato@consoft.com", "(11) 6985-2365", endereco5);
        Fornecedor fornecedor3 = new Fornecedor("Marcãosoft Eletronicos", "75.325.826/0001-98", "contato@marcaosoft.com", "(44) 4586-2365", endereco);
        
        new DaoFornecedor().insert(fornecedor1);
        new DaoFornecedor().insert(fornecedor2);
        new DaoFornecedor().insert(fornecedor3);
        
        List<Date> admissao = new ArrayList<Date>();
        admissao.add(data4);
        
        List<Date> admissao1 = new ArrayList<Date>();
        admissao1.add(data4);
        
        List<Date> admissao2 = new ArrayList<Date>();
        admissao2.add(data11);
        admissao2.add(data12);
        
        List<Date> admissao3 = new ArrayList<Date>();
        admissao3.add(data14);
        admissao3.add(data7);
        admissao3.add(data5);
        
        List<Date> demissao = new ArrayList<Date>();
        
        List<Date> demissao1 = new ArrayList<Date>();
        demissao1.add(data9);
        demissao1.add(data8);        
        
        List<Date> demissao2 = new ArrayList<Date>();
        demissao2.add(data15);
        demissao2.add(data13);

        Funcionario funcionario = new Funcionario("Eraldonclóbes", "456.789.123-000", "(44) 1234-5678", endereco9, 1, "eraldoclobes@email.com", data19, admissao, demissao, 1500.00, true);
        Funcionario funcionario1 = new Funcionario("Uósteles Filho", "874.965.854-23", "(44) 6584-8956", endereco6, 1, "uosFilho@email.com", data16, admissao1, demissao, 1500.00, true);
        Funcionario funcionario2 = new Funcionario("Bananéia Oliveira", "445.698.123-47", "(44) 5698-1254", endereco7, 2, "bananaOliveira@email.com", data17, admissao2, demissao1, 1300.00, false);
        Funcionario funcionario3 = new Funcionario("Dezêncio Feverêncio", "325.451.236-99", "(44) 5478-1265", endereco8, 3, "10encio@email.com", data18, admissao3, demissao2, 1000.00, true);
        
        new DaoFuncionario().insert(funcionario);
        new DaoFuncionario().insert(funcionario1);
        new DaoFuncionario().insert(funcionario2);
        new DaoFuncionario().insert(funcionario3);
        
        
    }
}
