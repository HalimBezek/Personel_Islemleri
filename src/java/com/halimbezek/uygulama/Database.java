
package com.halimbezek.uygulama;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Database {
    String URL="jdbc:mysql://localhost:3306/test";
    String USERNAME="root";
    String PASSWORD="";
    Connection baglanti;

    public Database() throws ClassNotFoundException, SQLException {
        
        Class.forName("com.mysql.jdbc.Driver");
        baglanti=(Connection) DriverManager.getConnection(URL, USERNAME,PASSWORD);
    }
    
    public boolean kaydet(String _sorgu)
    {
        Boolean durum=false;
      
        try {
            PreparedStatement kaydet;
            kaydet = (PreparedStatement) baglanti.prepareStatement(_sorgu);
            kaydet.executeUpdate();
            durum=true;
            baglanti.close();
            
        } catch (SQLException ex) {
            durum=false;
        }
          
        return durum; 
    }
    
    public ResultSet kayitgetir(String _sorgu){
    
        ResultSet result = null;
        try {
            java.sql.Statement  sorgu = baglanti.createStatement();
            result = sorgu.executeQuery(_sorgu);
        } catch (SQLException e) {
            result = null;
        }
        return result;
    }

}
