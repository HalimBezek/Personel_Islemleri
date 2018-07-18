<%-- 
    Document   : kayitsil
    Created on : Jul 16, 2018, 11:29:31 PM
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
    <body>
        <%
            String ID = request.getParameter("id");
            out.print("id = " +ID);
            String sorgu = "DELETE FROM `tbl_personel` WHERE id = " + ID;
            
            Database database = new Database();
            database.kaydet(sorgu);//kodu update ettiği için sorun olmayacaktır
        %>
        <jsp:forward page="islemler_sayfasi.jsp"/>
            
    </body>
</html>
