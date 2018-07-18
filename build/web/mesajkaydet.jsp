<%-- 
    Document   : mesajkaydet
    Created on : Jul 16, 2018, 12:11:53 PM
    Author     : Halim
--%>

<%@page import="com.halimbezek.uygulama.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persnel İşlemleri</title>
    </head>
    <body><%
          int durum = 0; //mesaj okunmamış durumu
            String mesaj = request.getParameter("mesaj_text");
           String id = request.getParameter("id");
            
            if(!mesaj.equals(null))
            {
            
            String sorgu = "INSERT INTO `tbl-ozelmesaj`( `personel_id`, `mesaj`, `durumu`) VALUES ("+
                   id +",'"+ mesaj+ "',"+durum+ ")"; 
            Database database = new Database();
            boolean gonderildi_mi = database.kaydet(sorgu);
            if(gonderildi_mi)
            {
            out.print("Mesaj Gönderildi.");
            %>
        
            <jsp:forward page="islemler_sayfasi.jsp"/>
           <%
            }
            else{
            out.print("Mesaj gönderilemedi");
            }
            }
            %>
            
    </body>
</html>
