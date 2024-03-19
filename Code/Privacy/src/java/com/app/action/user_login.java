/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.app.utility.DBConnectionn;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author IBN5
 */
@WebServlet(name = "user_login", urlPatterns ={"/user_login"})
public class user_login extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String username=request.getParameter("username");
         
            String password=request.getParameter("password");
            
          Connection con= DBConnectionn.getConnection();
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from user where username='"+username+"'");
          if(rt.next()){
              String p=rt.getString("password");
          
              //String id=rt.getString("iduser");
              String emailid=rt.getString("emailid");
               String username1=rt.getString("username");
               String userid=rt.getString("userid");
              if(password.equalsIgnoreCase(p)){
                  
                      HttpSession user=request.getSession(true);
                      user.setAttribute("username", username1);
                      System.out.println(username1);
                       user.setAttribute("emailid", emailid);
                       user.setAttribute("userid", userid);
                      response.sendRedirect("UserHome.jsp?msg=success");
                  
                
              }
              else{
                  response.sendRedirect("user.jsp?msg=wrongpassword");
              }
          }
          else{
              response.sendRedirect("user.jsp?msg=failed");          }
        }
        catch(Exception e){
            out.println(e);
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
