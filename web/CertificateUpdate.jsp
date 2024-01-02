<%-- 
    Document   : editCertificate
    Created on : 19-Oct-2023, 1:32:17 am
    Author     : HUDA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="bootstrap.css"><!--  -->
        <link rel="stylesheet" type="text/css" href="form5.css">
    </head>
    <body>
    <%!String name;%>
    <%!String orga;%>
    <%!String yea;%>
    <%!String email;%>
    <%
    Connection con=null;
    Statement smt=null;
    ResultSet rs=null;
   
          
           
      email=request.getParameter("email");
               try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                
              
            }
            
            try {
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
               
            } catch (SQLException ex) {
                 out.println(ex);
             
            }
                try {
                  smt=con.createStatement();
               
            } catch (SQLException ex) {
                 out.println(ex);
   
            }
            String query="select * from certificate where name='"+request.getParameter("name")+"' and email='"+request.getParameter("email")+"'";
                  try {
                  rs=smt.executeQuery(query);
               
            } catch (SQLException ex) {
                 out.println(ex);

            }
            while(rs.next())
            {
            name=rs.getString("name");
            orga=rs.getString("org");
            yea=rs.getString("year");

           
        }
             

           
    %>
    <div class="container-fluid">
        <div class="row">
            <div class="col-3" id="c1" style="color:white;">
               <div class="container">
                <nav class="navbar bg-body-dark">
                    <div class="container-fluid">
                      <a class="navbar-brand" href="#">
                        <img src="pictures/document-management-big.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                        <h4 style="color:white;">TalentPallets</h4>
                      </a>
                    </div>
                  </nav>
                  <nav class="navmenu">
                    <ul>
                        <li><a class="nav-link active">Header</a></li>
                      <li><a class="nav-link active">Experience</a></li>
                      <li><a class="nav-link active">Education</a></li>
                      <li><a class="nav-link active">Projects</a></li>
                      <li><a class="nav-link active" href="#">Certifications</a></li>                      
                      <li><a href="#">Summary</a></li>
                      <li><a href="#">Finalize</a></li>
                    </ul>
                  </nav>
                    </div>
                
               
 
            </div>
            <div class="col-9">
              <div class="container-fluid c2">
                <h1>Let's see your Achievements</h1>
                <p>Include all your Professional Certificates</p>
              </div>
<div class="container">
    <form action="http://localhost:8088/WebApplication2/EditCertificate" method="post">
        
  
  <div class="contact-form row">
    <div class="from-field col-lg-30">
      <label for="What was the certificate name?" class="label">What was the certificate name</label>
      <input id="What was the certificate name" class="input-text" type="text" name="name" value="<%=name%>">
    </div>
    <div class="from-field col-lg-30">
      <label for="Where did you get the Certificate?" class="label">Where did you get the Certificate</label>
      <input id="Where did you get the Certificate" class="input-text" type="text" name="org" value="<%=orga%>">
    </div>
    <div class="from-field col-lg-30">
      <label for="When did you get your Certificate?" class="label">When did you get your Certificate?</label>
      <input id="year" class="input-text" type="number" min="1900" max="2099" name="year" value="<%=yea%>">
    </div>
     
      <div class="from-field col-lg-6">
        
          <input type="submit" id="b1" class="Submit" value="Submit">
      </div>
      <div class="from-field col-lg-6">
         <input type="submit" id="b1" class="Submit" value="Back">
   
    
      </div>
        <div class="from-field col-lg-6">
      
                          <input id="Job Title" class="input-text" type="text" name="email" value="<%=email%>">
    </div>
    </div>
  </div>
      </form>
</div>
    
               
            </div>
    
        </div>
    
    </body>
</html>
