<%-- 
    Document   : mesajgonder
    Created on : Jul 16, 2018, 10:25:13 AM
    Author     : Halim
--%>

<%@page import="com.halimbezek.uygulama.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persnel İşlemleri</title>
         <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">                     
      
    </head>
    <body>
        <%
        HttpSession oturum= request.getSession(true);
        String kullanici_adi = oturum.getAttribute("oturum_adi").toString();
        //out.print("Hoşgeldin: " + kullanici_adi);
        String ID = request.getParameter("id");
        String isim = request.getParameter("isim");
        String soyisim = request.getParameter("soyisim");

        %>
        <form action="mesajkaydet.jsp" method="post" >
             <table width="100%" >
                    <tr>
                       
                        <td align="left"  ><img src="img/plogo.png" width="320" height="180" border="0"/></td>
                        <td valign="top" align="right">
                            <b>Hoşgeldin : @<%=kullanici_adi%></b> <br>
                            <a href="cikisyap.jsp"  style="color:red" ><b>Çıkış Yap</b></a>

                        </td>
                    </tr>
                </table> 
            <center>
            
            <table>
                <thead> 
                    <td >   </td>
                    <td align="center">
                        <b>Personel Mesaj</b>
                    </td>
                </thead>
                <tbody class="table table-hover">
                <tr>
                    <td></td>
                    <td> <%
                         out.print("Mesaj gönderilecek kişi : " + isim + " " +soyisim);                                   
                        %></td>
                </tr>
                <tr><td></td>
                    <td><textarea name="mesaj_text" cols="60" rows="15" ></textarea></td>
                     <input type="hidden" value="<%=ID%>" name="id"/>
                </tr>
                <tr>
                    <td></td>
               
                    <td align="right"><input type="submit" value="Gönder" class="btn btn-outline-primary"/> </td>
                </tr>
                 <tr>
                    <td></td>               
                    <td /> <a href="mesajgoster.jsp?id=<%=ID%>">Gönderilen mesajları göster</a> </td>
                </tr>
                <tr>
                    <td></td>               
                    <td /> <a href="islemler_sayfasi.jsp">İşlemler sayfasına git</a> </td>
                </tr>
                </tbody>
            </table>
            
            </center>
            
        </form>
                
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
  
    </body>
</html>
