


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>

<%

    String username=request.getParameter("username");
    System.out.println(username);
    String password=request.getParameter("password");
 String emailid=request.getParameter("emailid");
     String contactno=request.getParameter("contactno");
      String gender=request.getParameter("gender");
       String state=request.getParameter("state");
        String country=request.getParameter("country");
         String dob=request.getParameter("dob");
  try{
//   Class.forName("org.sqlite.JDBC");
//  Connection con=DriverManager.getConnection("jdbc:sqlite:/home/ibn/Desktop/Nadanapathy/NetBeansProjects/multi-autority _cloud_storage/multiauthority");
   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
//       
     
//   Connection con=DbConnection.getConnection();
     // Connection con = 
   
  Statement st=con.createStatement();
  int i=st.executeUpdate( "INSERT INTO user (username,password,emailid,contactno,gender,state,country,dob) VALUES('"+username+"','"+password+"','"+emailid+"','"+contactno+"','"+gender+"','"+state+"','"+country+"','"+dob+"')");
   con.close();
   if(i!=0){
     //  out.println("<script>alert('registered')</script>");
       response.sendRedirect("user.jsp?msg=registered sucess..!");
   }
  
  }
  catch(Exception e){
      out.println(e.getMessage());
  }
%>