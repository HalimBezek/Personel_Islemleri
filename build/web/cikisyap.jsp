<%-- 
    Document   : cikisyap
    Created on : Jul 16, 2018, 7:13:25 AM
    Author     : Halim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persnel İşlemleri</title>
    </head>
    <body>
        <%
        HttpSession oturum = request.getSession();
        oturum.invalidate();
       // response.sendRedirect("index.jsp"); buda olurdu.
        %>
        <jsp:forward page="index.jsp"/>
    </body>
</html>
