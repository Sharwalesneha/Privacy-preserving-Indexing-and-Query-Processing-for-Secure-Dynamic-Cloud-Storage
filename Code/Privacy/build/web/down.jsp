<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
String fileid=request.getParameter("fileid"); 
String privatekey=request.getParameter("prikey");
String aggrigatekey=request.getParameter("aggkey");
String filename=request.getParameter("filename");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
Statement st=con.createStatement();
String sql ="select * from filerequest where fileid='"+fileid+"' and privatekey ='"+privatekey+"' and aggrigatekey = '"+aggrigatekey+"'";
ResultSet rt=st.executeQuery(sql);
if(rt.next()){
 String fileid1=rt.getString("fileid");    
response.sendRedirect("down1.jsp?fileid="+fileid1+"");
}
else{
         
   response.sendRedirect("down.jsp?msg=faild");
}

%>
%>