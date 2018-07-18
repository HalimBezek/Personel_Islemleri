

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.halimbezek.uygulama.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Persnel İşlemleri</title>
            <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">                     
   
    </head>
    <body>
         <%
            HttpSession oturum = request.getSession();
            String k_adi = oturum.getAttribute("oturum_adi").toString();
            String ID = request.getParameter("id");
        %>
         <table width="100%" >
            <tr>

                <td align="left"  ><img src="img/plogo.png" width="320" height="180" border="0"/></td>
                <td valign="top" align="right">
                    <b>Hoşgeldin : @<%=k_adi%></b> <br>
                    <a href="islemler_sayfasi.jsp">İşlemler Sayfasina Git</a> <br>
                    <a href="cikisyap.jsp"  style="color:red" ><b>Çıkış Yap</b></a>

                </td>
            </tr>
        </table> 
       
    <center>
        <b>Gelen Mesaj Kutusu   </b><br> 
    </center>
    <hr/>
    <table><tr>
         <%
          
            String sorgu = "SELECT `id`, `durumu` FROM `tbl-ozelmesaj` WHERE personel_id ="+ID;
       
            String mail_durumu="";
            Database database = new Database();
            ResultSet result =  database.kayitgetir(sorgu);
            while(result.next())
            {
               String  id = result.getString("id");
               String  durum = result.getString("durumu");
                  if(durum.equals("0"))
                    {
                        mail_durumu="img/okunmayan.jpg";    
                    }
                 else  mail_durumu="img/okunan.jpg";
                 out.print("<td><a href='mesajgoster.jsp?id2="+id+"'><img src='"+mail_durumu+" ' width='60' height='60' /></a></td>");

            } 
            %>
         </tr>
    </table>
        <%
        String id_mesaj = request.getParameter("id2");
        if(id_mesaj != null)
        {
            String sorgu_mesaj = "SELECT `mesaj` FROM `tbl-ozelmesaj` WHERE id ="+ Integer.parseInt(id_mesaj);
            Database database_mesaj = new Database();
            ResultSet result_mesaj =  database_mesaj.kayitgetir(sorgu_mesaj);
            while(result_mesaj.next())
            {
                 out.print("<b>"+result_mesaj.getString("mesaj")+"</b>");
            }
  
            String sorguUpdate = "UPDATE `tbl-ozelmesaj` SET `durumu`=1 WHERE id =" +id_mesaj;

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
            
        %> 
    <hr/>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
    </body>
</html>
