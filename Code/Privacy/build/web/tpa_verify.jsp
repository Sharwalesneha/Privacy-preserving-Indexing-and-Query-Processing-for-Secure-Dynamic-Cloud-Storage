


<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String admin=request.getParameter("tpid");
String pass=request.getParameter("password");


    
//      Class.forName("org.sqlite.JDBC");
//  Connection con=DriverManager.getConnection("jdbc:sqlite:/home/ibn/Desktop/Nadanapathy/NetBeansProjects/multi-autority _cloud_storage/multiauthority");
 Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
//   
    
  System.out.println("Database connected");
  
  Statement st=con.createStatement();
  ResultSet rt=st.executeQuery("select * from tp where tpid='"+admin+"'");
  System.out.println("result set executed");
  if(rt.next()){
      String p=rt.getString("password");
      if(p.equals(pass)){
        
          response.sendRedirect("tpahome.jsp");
      }
      else{
         
          response.sendRedirect("tpa.jsp?msg=failed");
      }
  }
  else{
      
      response.sendRedirect("tpa.jsp?msgg=failed");
   
  }
    
%>
%>