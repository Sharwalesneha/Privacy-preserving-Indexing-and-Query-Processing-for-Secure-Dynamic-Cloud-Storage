	<!DOCTYPE html>
        
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.app.utility.DBConnectionn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Travel</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/jquery-ui.css">				
			<link rel="stylesheet" href="css/nice-select.css">							
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/owl.carousel.css">				
			<link rel="stylesheet" href="css/main.css">
		</head>
		<body>	
			<header id="header">
				<div class="header-top">
					<div class="container">
			  		<div class="row align-items-center">
			  			
			  			
			  		</div>			  					
					</div>
				</div>
				<div class="container main-menu">
					<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo">
                                          <b><a  style="font-size:130%; color: yellow;" href="index.html">Privacy-Preserving Indexing And Query Processing</a></b><br> 
                                          <b> <a style="font-size:130%; color: yellow;" href="index.html"> For Secure Dynamic Cloud Storage</a></b><br>
				      </div>
				      <br> 
                                             <nav id="nav-menu-container">
				        <ul class="nav-menu">
				        <li><a href="cloudhome.jsp">BACK</a></li>
	                                  </ul>
				      </nav>		      		  
					</div>
				</div>
			</header><!-- #header -->
                    
			  
			<!-- start banner Area -->
			<section class="about-banner relative">
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
                                                  
							<h1 class="text-white">
								OWNER DETAILS				
                                                        </h1><br>
                                                    
						  
     
   
      <fieldset>          
    <table align="center" border="1" bordercolor="YELLOW"  cellspacing="1px" cellpadding="10px" width="10px">
        <tr>
            <th><font color='Red'>OWNER ID</font></th>
        <th><font color='Red'>OWNER NAME</font></th>
       
        <th><font color='Red'>MAIL</font></th>
         <th><font color='Red'>CONTACTNO</font></th>
        <th><font color='Red'>GENDER</font></th>
       <th><font color='Red'>STATE</font></th>
         <th><font color='Red'>COUNTRY</font></th>
        <th><font color='Red'>DOB</font></th>
        </tr>
     
        <%
              
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int sno = 0;
        try{
         String query = "select *from owner";
         con = DBConnectionn.getConnection();
         ps = con.prepareStatement(query);       
         rs = ps.executeQuery();
         while(rs.next()){
         int oid=rs.getInt("ownerid");
         String ownername = rs.getString(2);
         String password= rs.getString(3);
          String emailid= rs.getString(4);
           String contactno= rs.getString(5);
           String gender= rs.getString(6);
           String state= rs.getString(7);
           String country= rs.getString(8);
           String dob= rs.getString(9);
         
          %>
         <tr>
             <td><font color='white'><%=oid%></font></td>
             <td><font color='white'><%=ownername%></font></td>
             
            
             <td><font color='white'><%=emailid%></font></td>
               <td><font color='white'><%=contactno%></font></td>
               <td><font color='white'><%=gender%></font></td>
             <td><font color='white'><%=state%></font></td>
               <td><font color='white'><%=country%></font></td>
               <td><font color='white'><%=dob%></font></td>
               
         </tr>
        
        <%
         }
        }catch(Exception e){
        System.out.println("Error at Getting File "+e.getMessage());
        e.printStackTrace();
        }
        
%>

    </table>

      </fieldset><br><br><br>

      </form>
						</div>	
					</div>
				</div><br><br><br><BR><BR>
                                                            

			</section>
			<!-- End banner Area -->	

			


			
				
		</body>
	</html>