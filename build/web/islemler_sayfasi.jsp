<%-- 
    Document   : islemler_sayfasi
    Created on : Jul 15, 2018, 9:23:02 PM
    Author     : Halim
--%>

<%@page import="java.sql.ResultSet"%>
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
        HttpSession oturum = request.getSession(true);
        String oturum_adi = oturum.getAttribute("oturum_adi").toString();
        String k_adi="";
        if(oturum_adi == null )
        {
            %>
            <jsp:forward page="index.jsp"/>       
        <%
        }else{

            k_adi=oturum_adi;
          
        }
        %>
        
           <table width="100%" >
                    <tr>
                        <td valign="top"> <a href="kayit_ekle.jsp"><img src="img/personelkayit.jpg" width="80" height="80" border="0"/><br>
                            Personel Ekle</a></td>
                        <td align="center"  ><img src="img/plogo.png" width="320" height="180" border="0"/></td>
                        <td valign="top" align="right">
                            <b>Hoşgeldin : @<%=k_adi%></b> <br>
                            <a href="cikisyap.jsp"  style="color:red" ><b>Çıkış Yap</b></a>

                        </td>
                    </tr>
                </table>  
              <hr/> 
       
        <table align="center" class="table table-hover">
            <thead  align="center">
                <th >
                    <b >Kayıtlı Personeller Listesi</b>
                </th>
            </thead>
            <tbody>
            <tr bgcolor="white">
                <td>ID </td>
                <td>Adı </td>
                <td>Soyadı</td>
                <td>Mesai Saati </td>
                <td>Maaş </td>
                <td>Departman </td>
                <td>Mesaj Gönder </td>
                <td>Düzenle </td>
                <td>Sil </td>
                
            </tr>
                    <%//personel bilgilrinin listesi..

                    String sorgu = "Select tbl_personel.id, tbl_personel.adi, tbl_personel.soyadi,"+
                            "tbl_personel.mesai_saati,tbl_personel.maasi,tbl_detaypersonel.departman_name"+
                            " From tbl_personel,tbl_detaypersonel Where tbl_personel.departman_id = tbl_detaypersonel.departman_id";
                   
                    Database database = new Database();
                    ResultSet res = database.kayitgetir(sorgu);
                    
                    while(res.next()){
                      
                        out.print("<tr >" );
                        out.print("<td>" + res.getString("id") + "</td>");
                        out.print("<td>" + res.getString("adi") + "</td>");
                        out.print("<td>" + res.getString("soyadi") + "</td>");
                        out.print("<td>" + res.getString("mesai_saati") + "</td>");
                        out.print("<td>" + res.getString("maasi") + "</td>");
                        out.print("<td>" + res.getString("departman_name") + "</td>");
                        out.print("<td> <a href='mesajgonder.jsp?id="+res.getString("id")+ "&isim="+res.getString("adi") +  "&soyisim="+res.getString("soyadi") +
                                "'><img src='img/gonderilenler.jpg' width='50' height='50'/></a></td>");
                        out.print("<td> <a href='kayit_duzenle.jsp?id="+res.getString("id")+ "'><img src='img/düzenle.jpg' width='50' height='50'/></a></td>");
                        out.print("<td> <a href='kayitsil.jsp?id="+res.getString("id")+ "'><img src='img/sil.jpg' width='50' height='50'/></a></td>");
                      
                        //out.print("<td> <a href='mesajgonder.jsp?id="+res.getString("id")+"&isim="res.getString("name")+  yapılarak ikinci değişkenide gönderebiliriz.
                        out.print("</tr>" );
                    }

                    %>
     
            </tbody>
        </table>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
  
    </body>
</html>
