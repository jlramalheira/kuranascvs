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
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Joao Luiz
 */
@Entity
public class Funcionario implements Serializable {

    public static final int ADMINISTRADOR = 0;
    public static final int ATENDENTE = 1;
    public static final int CAIXA = 2;
    public static final int TECNICO = 2;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nome;
    private String cpf;
    private String telefone;
    @OneToOne
    private Endereco endereco;
    private String email;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataNascimento;
    private List<Date> dataAdmissao;
    private List<Date> dataDemissao;
    private double salario;
    private boolean contratado;
    private int cargo;

    public Funcionario() {
    }

    public Funcionario(String nome, String cpf, String telefone, Endereco endereco, int cargo, String email, Date dataNascimento, List<Date> dataAdmissao, List<Date> dataDemissao, double salario, boolean contratado) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.endereco = endereco;
        this.cargo = cargo;
        this.email = email;
        this.dataNascimento = dataNascimento;
        this.dataAdmissao = dataAdmissao;
        this.dataDemissao = dataDemissao;
        this.salario = salario;
        this.contratado = contratado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public List<Date> getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(List<Date> dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public List<Date> getDataDemissao() {
        return dataDemissao;
    }

    public void setDataDemissao(List<Date> dataDemissao) {
        this.dataDemissao = dataDemissao;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public boolean isContratado() {
        return contratado;
    }

    public void setContratado(boolean contratado) {
        this.contratado = contratado;
    }

    public int getCargo() {
        return cargo;
    }

    public void setCargo(int cargo) {
        this.cargo = cargo;
    }

    //metodos auxiliares
    public void addAdmissao(Date dataAdmissao) {
        this.dataAdmissao.add(dataAdmissao);
    }

    public void addDemissao(Date dataDemissao) {
        this.dataDemissao.add(dataDemissao);
    }

    public String getCargoStr() {
        switch (this.cargo) {
            case 0:
                return "Adiministrador";
            case 1:
                return "Atendente";
            case 2:
                return "Caixa";
            case 3:
                return "Técnico";
            default:
                return "";
        }
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
        if (!(object instanceof Funcionario)) {
            return false;
        }
        Funcionario other = (Funcionario) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Funcionario[ id=" + id + " ]";
    }
}
