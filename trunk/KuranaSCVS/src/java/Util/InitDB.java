/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Dao.DaoEndereco;
import Model.Endereco;

/**
 *
 * @author Joao Luiz
 */
public class InitDB {

    public static void main(String[] args) {
        Endereco endereco = new Endereco("", "", -1, "", "", "");
        new DaoEndereco().insert(endereco);
    }
}
