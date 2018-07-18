<%-- 
    Document   : kayit_düzenle
    Created on : Jul 16, 2018, 11:55:45 PM
    Author     : Halim
--%>

<%@page import="java.sql.SQLException"%>
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
        <form action="kayitguncelle.jsp" method="post"><br>
            
            <%
                String k_adi="";
                HttpSession oturum = request.getSession();
                String kullanici = oturum.getAttribute("oturum_adi").toString();
                //out.print("Hoşgeldin : " + kullanici);
                k_adi =kullanici;
                String id2="",adi="",soyadi="",m_saati="",maasi="",departman="",departman_id="";
                String id = request.getParameter("id");
                String sorgu = "Select tbl_personel.departman_id,tbl_personel.id, tbl_personel.adi, tbl_personel.soyadi,"+
                            "tbl_personel.mesai_saati,tbl_personel.maasi,tbl_detaypersonel.departman_name"+
                            " From tbl_personel,tbl_detaypersonel Where tbl_personel.id ="+id+" and  tbl_personel.departman_id = tbl_detaypersonel.departman_id ";
                   
                if(id!=null){
                Database database = new Database();
                ResultSet res = database.kayitgetir(sorgu);
   
                while(res.next()){
                     departman_id = res.getString("departman_id");
                     id2 = res.getString("id");
                     adi = res.getString("adi");
                     soyadi = res.getString("soyadi");
                     m_saati = res.getString("mesai_saati");
                     maasi = res.getString("maasi");
                     departman = res.getString("departman_name");
                 }    
           }
 
            %>
                       
            <table width="100%" >
                    <tr>
                       
                        <td align="left"  ><img src="img/plogo.png" width="320" height="180" border="0"/></td>
                        <td valign="top" align="right">
                            <b>Hoşgeldin : @<%=k_adi%></b> <br>
                            <a href="cikisyap.jsp"  style="color:red" ><b>Çıkış Yap</b></a>

                        </td>
                    </tr>
                </table> 
           <table align="center">
               <thead>
                    
                    <td align="center">
                        <b>Personel Kaydını Düzenle</b>
                    </td>
               </thead>
               <tbody class="table table-hover">
                    <tr>

                    <td>ADI :</td>
                     <td> <input type="text" value="<%=adi%>" name="adi"/></td>
                     </tr><tr>
                    <td>Soyadı :</td>
                    <td> <input type="text" value="<%=soyadi%>" name="soyadi"/></td>
                     </tr><tr>
                    <td>Mesai Saati</td> 
                    <td> <input type="text" value="<%=m_saati%>" name="m_saati"/></td> 
                     </tr><tr>
                    <td>Maaşı</td>
                    <td> <input type="text" value="<%=maasi%>" name="maasi"/></td>
                     </tr><tr>
                    <td>Departmanı</td> 
                    <td>
                         <select name="departman_id">
                             <option value="1">Mühendis</option>
                             <option value="2">Mimar</option>
                             <option value="3">Muhasebe</option>
                          </select>
                     </td>

                </tr>

                <tr align="right">
                    
                     <td> <input type="hidden" value="<%=id2%>" name="id2"/></td>
                    <td><input type="submit" value="Güncelle" class="btn btn-outline-primary"/></td>
                </tr>
                <tr>
                    <td><a href ="islemler_sayfasi.jsp">İşlemler sayfasına git</a></td>
                    <td></td>

                 </tr>
            </tbody>
        </table>
    </form>
             
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
  
    </body>
</html>
