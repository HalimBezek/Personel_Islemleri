<%-- 
    Document   : kayit_ekle
    Created on : Jul 15, 2018, 9:33:28 PM
    Author     : Halim
--%>

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
            HttpSession oturum = request.getSession();
            String isim = oturum.getAttribute("oturum_adi").toString();
            //out.print("Hoşgeldin : <b>" + isim + "</b>");
            
        %>
        <form action="PersonelKayit" method="post"> 
            <table width="100%" >
                    <tr>
                       
                        <td align="left"  ><img src="img/plogo.png" width="320" height="180" border="0"/></td>
                        <td valign="top" align="right">
                            <b>Hoşgeldin : @<%=isim%></b> <br>
                            <a href="cikisyap.jsp"  style="color:red" ><b>Çıkış Yap</b></a>

                        </td>
                    </tr>
                </table>  
            <center>
            <table   >
                <thead >
                      <th >Personel Kayıt</th>
                </thead>
                <tbody class="table table-hover">
                    <tr>
                        <td>Adı :</td>
                        <td><input type="text" name="adi"/></td>
                    </tr>
                     <tr>
                        <td>Soyadı :</td>
                        <td><input type="text" name="soyadi"/></td>
                    </tr>
                     <tr>
                        <td>Mesai saati :</td>
                        <td><input type="text" name="mesai_saati"/></td>
                    </tr>
                     <tr>
                        <td>Maaşı :</td>
                        <td><input type="text" name="maasi"/></td>
                    </tr>
                     <tr>
                        <td>Departman :</td>
                        <td>
                            <select name="Departman">
                                <option value="1">Mühendis</option>
                                <option value="2">Mimar</option>
                                <option value="3">Muhasebe</option>
                                    </select>
                        </td>
                    </tr>
                     <tr>
                        <td><input type="submit" name="kaydet" value="Kaydet" class="btn btn-outline-primary"/></td>
                    </tr>
                     <tr>
                         <td></td>
                         <td><a href ="islemler_sayfasi.jsp">İşlemler sayfasına git</a></td>

                    </tr>
                    <tr>
                         <td></td>
                        <td><a href ="mesajgoster.jsp">Çıkış yap</a> </td>
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
