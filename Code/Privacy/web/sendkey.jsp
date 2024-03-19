
<%@page import="com.app.utility.Generatedprivatekeyys"%>
<%@page import="com.app.action.mail_Send"%>
<%@page import="com.app.utility.GenerateAggrigatekeys"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.app.utility.DBConnectionn"%>
<%boolean k=true;
    String fileid = request.getParameter("fileid");
 String user = request.getParameter("emailid");
  String filename = request.getParameter("filename");
   Generatedprivatekeyys g3=new Generatedprivatekeyys();
      String pri = g3.generatekey();
       GenerateAggrigatekeys g=new GenerateAggrigatekeys();
      String agg= g.generatedRandom();
        if(k==true){
      mail_Send.sendMail("THE FILE NAME IS:  "+filename+"  ,THE PRIVATEKEY IS: "+pri+",THE AGGERIGATEKEY IS: "+agg+"  ", "File Key Information", "userid", user);
     Connection con=DBConnectionn.getConnection();
       Statement stmt=con.createStatement();
       int key1=stmt.executeUpdate("Update filerequest set privatekey ='"+pri+"',aggrigatekey ='"+agg+"' where fileid='"+fileid+"'");
      response.sendRedirect("requestdata.jsp?mail=public key send sucess..!");}
              else{
        System.out.println("Error found to sending mail..!");
        response.sendRedirect("requestdata.jsp?mailf=public key send fails..!");
    }

%>