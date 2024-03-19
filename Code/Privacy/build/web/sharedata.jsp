	<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.app.utility.Generateprivatekeys"%>
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
								SHARE DATA				
                                                        </h1><br>
                                                        <%
                               String ownername=session.getAttribute("ownername").toString();
                                %>
      
 <form action='sharedb?ownername=<%=ownername%>' method='post' >   
        <strong style="color: #4cd3e3;">FILEID</strong><br>
        <center>
       <select name="fileid"placeholder="enter fileid" >
        <%
         Connection con4 = null;
         Statement st5 = null;
         ResultSet rs5 = null;
          try {
         con4 = DBConnectionn.getConnection();
         st5= con4.createStatement();
         String ownername1=session.getAttribute("ownername").toString();
         rs5 = st5.executeQuery("select * from upload where ownername='"+ownername1+"'");
         while (rs5.next()) {
         String fileid = rs5.getString("fileid");
       
        %>
          <option value="<%=fileid%>"><%=fileid%></option>
        
                            <%        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </select>
        </center>
                        <br>
                        
     <strong style="color: #4cd3e3;"> SHARE TO:  </strong><br>
     <center>
                  <select name="username" >
                     
              
             
            <%
                               Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnectionn.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from user ");
                                    while (rs.next()) {
                                        String username = rs.getString("username");
                                        
                            %>
                            <option value="<%=username%>"><%=username%></option>

                            <%        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </select>
     </center><br/>
      <strong style="color: #4cd3e3;">USER MAILID</strong><br>
        <center>
       <select name="mailid" >
        <%
         Connection con3 = null;
         Statement st4 = null;
         ResultSet rs4 = null;
          try {
         con3 = DBConnectionn.getConnection();
         st4= con.createStatement();
         rs4 = st.executeQuery("select * from user ");
         while (rs4.next()) {
         String emailid = rs4.getString("emailid");
       
        %>
          <option value="<%=emailid%>"><%=emailid%></option>
        
                            <%        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </select>
        </center>
                        <br>
                        
          <strong style="color: #4cd3e3;">INDEX:</strong><br>
 <input type="text" name="index"></input><br></br>
          <strong style="color: #4cd3e3;">PRIVATE KEY</strong><br>
           <%
                                                    
            Generateprivatekeys k=new Generateprivatekeys();
            String privatekey=k.generateRandomString();
           %>
          <input type="text" name="privatekey" value="<%=privatekey%>"></input><br><br>
       <strong style="color: #4cd3e3;">FILENAME</strong><br>
        <center>
       <select name="filename" >
        <%
         Connection con1 = null;
         Statement st1 = null;
         ResultSet rs1 = null;
          try {
         con1 = DBConnectionn.getConnection();
         st1= con.createStatement();
          String ownername1=session.getAttribute("ownername").toString();
         rs1 = st.executeQuery("select * from upload where ownername='"+ownername1+"'");
         while (rs1.next()) {
         String filename = rs1.getString("filename");
      %>
          <option value="<%=filename%>"><%=filename%></option>
        
                            <%        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </select>
        </center>
                        </br>
                        <input type="submit" value="share">
      </form>
                                                        
						</div>	
					</div>
				</div>
                                                          

			</section>
			<!-- End banner Area -->	

			


			
				
		</body>
	</html>