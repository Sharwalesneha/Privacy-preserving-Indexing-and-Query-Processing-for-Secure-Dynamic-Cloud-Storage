<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
 String username=session.getAttribute("username").toString(); 
 String emailid=session.getAttribute("emailid").toString();
String ownername=request.getParameter("ownername");
System.out.println(ownername+"hello");
String fileid=request.getParameter("fileid");
String filename=request.getParameter("filename");
String status="waiting";
  try{
//   Class.forName("org.sqlite.JDBC");
//  Connection con=DriverManager.getConnection("jdbc:sqlite:/home/ibn/Desktop/Nadanapathy/NetBeansProjects/multi-autority _cloud_storage/multiauthority");
   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
//       
     
//   Connection con=DbConnection.getConnection();
     // Connection con = 
   
  Statement st=con.createStatement();
  int i=st.executeUpdate( "INSERT INTO filerequest (fileid,filename,username,emailid,ownername,status) VALUES('"+fileid+"','"+filename+"','"+username+"','"+emailid+"','"+ownername+"','"+status+"')");
   con.close();
   if(i!=0){
     //  out.println("<script>alert('registered')</script>");
       response.sendRedirect("UserHome.jsp?msg=requestsentsucess..!");
   }
  
  }
  catch(Exception e){
      out.println(e.getMessage());
  }
%>