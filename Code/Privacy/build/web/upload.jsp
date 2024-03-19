<%@page import="com.app.action.GenerateParsKeys"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.app.utility.DBConnectionn"%>
<!DOCTYPE html>
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
				          <li><a href="dataownerhome.jsp">BACK</a></li>
			                 
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
												
                                                        </h1><br>
                                               
       <%               
        //onnection con = null;
        Connection con=null;
       PreparedStatement ps = null;
        ResultSet rs = null;
        try{
              GenerateParsKeys k=new GenerateParsKeys();
        String privatekey=k.generatesRandomString();
        HttpSession hs=request.getSession();
        int oid=Integer.parseInt(hs.getAttribute("oid").toString());
        System.out.println(oid+"upload.jspoid");
        //int oid=session.getAttribute("oid");
              //System.out.println(oid+"upload.jsp"); //user.getAttribute("oid");
         String query = "select *from owner where ownerid='"+oid+"'";
         con = DBConnectionn.getConnection();
         ps = con.prepareStatement(query);       
         rs = ps.executeQuery();
         while(rs.next()){
         String ownername= rs.getString(2);   
         String emailid = rs.getString(4);
       %>
            
       <center>
               <h2 align='center'><font color='white'>FILE UPLOAD</font></h2>
               <form action='upload?oid=<%=oid%>&ownername=<%=ownername%>&emailid=<%=emailid%>' method='post' enctype="multipart/form-data">
               <table  color='white' align='center' border='7' height="150" width='420'>
                  
                        <tr>
                            <td><font color='yellow'>INDEX:</font></td><td><input type="text" name="index"></td>
                       </tr>
                         <tr>
                            <td><font color='yellow'>PRIVATE KEY:</font></td><td><input type="text" name="privatekey" value=<%=privatekey%>></td>
                       </tr><br>
                      
             
             
                       
                       <tr>
                           <td><font color='yellow'>CHOOSEFILE</font></td><td><input type='file' name="file"/></td>
                       </tr>
               </table><br>
                  <p align='center'><font color='#4B0082'><input type='submit' value='  Encrypt&Upload   ' style="color:blue;"/></font></p>
                  </form>  
               </center>
      
       
               <%
         }
        }catch(Exception e){
        System.out.println("Error at Getting File "+e.getMessage());
        e.printStackTrace();
        }finally{
        try{
        rs.close();
        ps.close();
        con.close();
        }catch(Exception e){
        out.println(e);
        }
        }
%>
               
     
						
					
			</div>
			
		</div>
	</div></div><br><br><br><br><br>
        </body>
</html>