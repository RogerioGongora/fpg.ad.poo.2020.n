/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import model.Categoria;
import model.Usuario;/**
 * Web application lifecycle listener./**
 * Web application lifecycle listener.
 * @author Rogerio
 */

 
 
public class DbListener implements ServletContextListener{
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String DB_URL = "jdbc:sqlite:my-finance.db";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL);
    
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce){
        String etapa = "Inicialização";
        Connection con = null;
        Statement stmt = null;
        try {
            etapa = "Registrando a classe no driver";
            Class.forName(CLASS_NAME);
            etapa = "Conectando com o Banco de Dados";
            con = DriverManager.getConnection(DB_URL);
            etapa = "Preparando o statement";
            stmt = con.createStatement();
            etapa = "Criando a Tabela de Usuários";
            stmt.execute(Usuario.getCreateStatement());
            if(Usuario.getList().isEmpty()){
                stmt.execute("INSERT INTO usuarios VALUES("
                        + "'admin',"
                        + "'ADM',"
                        + "'ADMINISTRADOR',"
                        + "1234".hashCode()+");");
                stmt.execute("INSERT INTO usuarios VALUES("
                        + "'Rogerio',"
                        + "'Rogerio Alexandre Gongora',"
                        + "'ALUNO',"
                        + "1234".hashCode()+")");
            }
            
           etapa = "Criando a Tabela de Categorias";
            stmt.execute(Categoria.getCreateStatement());
            
            etapa = "Desconectando do Banco de Dados";
        
        } catch (Exception ex) {
            exceptionMessage = etapa+": "+ex.getLocalizedMessage();
        
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
                
            }
    
        }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce){
        
    }

}