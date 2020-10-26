package db;

import java.sql.*;
import java.util.ArrayList;
import org.apache.naming.java.javaURLContextFactory;

/**
 *
 * @author rlarg
 */
public class TasksConnector {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String URL = "jdbc:sqlite:C:\\Users\\Rogerio\\Desktop\\tasks-noturno.db";
    
    public static ArrayList<String> select() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Class.forName(CLASS_NAME);
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Tasks");
        while(rs.next()){
            list.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    public static void insert(String name) throws Exception{
        Class.forName(CLASS_NAME);
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        stmt.execute("insert into Tasks values('"+name+"')");
        stmt.close();
        con.close();
    }
    public static void delete(String name) throws Exception{
        Class.forName(CLASS_NAME);
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        stmt.execute("delete from Tasks where name = '"+name+"'");
        stmt.close();
        con.close();
    }
}