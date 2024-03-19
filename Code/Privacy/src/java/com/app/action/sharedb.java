/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JAVA
 */
public class sharedb extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
String filename=request.getParameter("filename");      
String privatekey=request.getParameter("privatekey");
String filefrom=request.getParameter("ownername");
String fileid=request.getParameter("fileid");
String fileto=request.getParameter("username");
String emailid=request.getParameter("mailid");
String index1=request.getParameter("index");
String status="WAITING";
try{
//   Class.forName("org.sqlite.JDBC");
//  Connection con=DriverManager.getConnection("jdbc:sqlite:/home/ibn/Desktop/Nadanapathy/NetBeansProjects/multi-autority _cloud_storage/multiauthority");
   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
//       
     
//   Connection con=DbConnection.getConnection();
     // Connection con = 
   
  Statement st=con.createStatement();
  int i=st.executeUpdate( "INSERT INTO shareinfo (fileid,filefrom,fileto,index1,filename,privatekey,status,emailid) VALUES('"+fileid+"','"+filefrom+"','"+fileto+"','"+index1+"','"+filename+"','"+privatekey+"','"+status+"','"+emailid+"')");
   con.close();
   if(i!=0){
     //  out.println("<script>alert('registered')</script>");
       response.sendRedirect("sharedata.jsp?msg=sharedsucessfully..!");
   }
  
  }
  catch(Exception e){
      out.println(e.getMessage());
  }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
