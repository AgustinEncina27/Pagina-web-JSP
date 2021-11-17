/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Aaron
 */
public class Conexion {
    private String USERNAME = "postgres";
    private String PASSWORD = "oscar1432";
    private String HOST = "localhost";
    private String PORT = "5433";
    private String DATABASE = "Prueba";
    private String CLASSNAME = "org.postgresql.Driver";
    private String URL = "jdbc:postgresql://"+HOST+":"+PORT+"/"+DATABASE;
    private Connection con ;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch(ClassNotFoundException e){
            System.err.println("ERROR + e");
        } catch(SQLException e){
            System.err.println("ERROR + e");
        }
    }
    
    public Connection getConexion(){
        return con;
    }
    public static void main(String[] args) {
        Conexion con = new Conexion();
    }
}
