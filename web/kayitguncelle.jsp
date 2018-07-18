<%-- 
    Document   : kayitguncelle
    Created on : Jul 17, 2018, 11:02:38 AM
    Author     : Halim
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.halimbezek.uygulama.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persnel İşlemleri</title>
    </head>
    <body>
        
      <%
        String ad = request.getParameter("adi");
        String soyad = request.getParameter("soyadi");
        String mesai_saati = request.getParameter("m_saati");
        String maas = request.getParameter("maasi");
        String departman_id = request.getParameter("departman_id");
       
        if(ad!=null){
            String sorguUpdate = "UPDATE `tbl_personel` SET `adi`='"+ad+"',`soyadi`='"+soyad+"',`mesai_saati`="+mesai_saati+
                    ",`maasi`="+maas+",`departman_id`="+departman_id+" WHERE id=" +request.getParameter("id2");

 
            Database database2;
            try {
                database2 = new Database();
                database2.kaydet(sorguUpdate);
             }catch (SQLException ex) {
               out.print("Sql hatası");
            } catch (ClassNotFoundException ex) {
                out.print("Class not found");
            }
        }    
        
        response.sendRedirect("islemler_sayfasi.jsp");
                %>
    </body>
</html>
