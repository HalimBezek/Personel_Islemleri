
package com.halimbezek.servlet;

import com.halimbezek.uygulama.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonelKayit extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        String ad = request.getParameter("adi");
        String soyad = request.getParameter("soyadi");
        String mesai_saati = request.getParameter("mesai_saati");
        String maasi = request.getParameter("maasi");
        String d_id = request.getParameter("Departman");
        
        String sorgu = "INSERT INTO `tbl_personel`( `adi`, `soyadi`, `mesai_saati`, `maasi`, `departman_id`)"+
                " VALUES ('"+ad+"','"+soyad+"',"+mesai_saati+","+maasi+","+d_id+")";
        
              
        Database database;
        try {
            database = new Database();
            database.kaydet(sorgu);
         }catch (SQLException ex) {
            Logger.getLogger(PersonelKayit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PersonelKayit.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //veri gelişleri testi için
        //response.setContentType("text/html;charset-UTF-8");
        //PrintWriter out = response.getWriter();
        //out.print(ad + soyad + mesai_saati + maasi + d_id);
       // out.print("<a href = 'islemler_sayfasi.jsp'/>islemler sayfasına git</a>");
        
        response.sendRedirect("islemler_sayfasi.jsp");
    }

}
