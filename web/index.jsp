<%-- 
    Document   : index
    Created on : Jul 15, 2018, 8:48:50 PM
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
        <form action="index.jsp" method="post"  > <center>
            <table cellpadding="4"  width="40%"  >
                <thead align ="center" > 
                  <th class="alert alert-dark" role="alert" > Kullanıcı Girişi</th><br>        
                </thead>
                <tbody class="table table-hover">
                    <tr> 
                        <td align ="top" >
                            <p class="text-bbbbbb"> Kullanıcı Adı :</p>
                            <input type="text" name="k_adi" value="" class="form-control" />
                        </td>
                    </tr> 
                    <tr > 
                        <td align ="top" colspan="2" >
                             <p > Şifre :</p>
                             <input type="password" name="k_sifre" value="" class="form-control"/>
                        </td>
                    </tr>            
                     <tr> 
                         <td align ="center" ><br><br>
                            <input type="submit" value="Giriş" class="btn btn-info btn-lg btn-block" />
                        </td>     
                    </tr>
                        <tr> 

                         <td align ="center" ><br>
                            <input type="reset" value="Sıfırla" class="btn btn-info btn-lg btn-block"/>
                        </td>
                       
                    </tr>
                </tbody>
            </table>
                
            </center>
          
        </form>
        
        <%
            //login kontrolü,doğru ise işlemler sayfasına yonlendir
            //session oluştur.
            String kullanici_adi = request.getParameter("k_adi");
            String kullanici_sifre = request.getParameter("k_sifre");
            if(kullanici_adi != null){
            String sorgu = "Select * from tbl_login Where kullanici_adi = '" +kullanici_adi +"'";
            Database database = new Database();
            ResultSet res = database.kayitgetir(sorgu);
            while(res.next())
            {
                String kadi=res.getString("kullanici_adi");
                String ksifre=res.getString("sifre");
                if(kullanici_adi.trim().equals(kadi) && kullanici_sifre.trim().equals(ksifre))
                {
                    HttpSession oturum = request.getSession(true);//kullanıcı oturumu oluşturmak için
                    oturum.setAttribute("oturum_adi", kadi);//kullnıcı adı alındı
                %>
                <jsp:forward page="islemler_sayfasi.jsp"/>
                <%
                }else{
                out.print("bilgiler yanlış. <br>");

                    }

            }
         }
        %>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
    </body>
</html>
