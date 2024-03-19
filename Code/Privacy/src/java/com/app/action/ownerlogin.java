/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JAVA
 */
public class ownerlogin extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             String ownername=request.getParameter("ownername");
            String password=request.getParameter("password");
           
          Connection con= DBConnectionn.getConnection();
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from owner where ownername='"+ownername+"'");
          if(rt.next()){
              String p=rt.getString("password");
               int oid=rt.getInt("ownerid");
              if(password.equalsIgnoreCase(p)){
                 
               HttpSession user=request.getSession();
               user.setAttribute("ownername", ownername);
               System.out.println(ownername);
               user.setAttribute("oid", ""+oid);
               response.sendRedirect("dataownerhome.jsp?ownername="+ownername+"");
             }
              else{
                  response.sendRedirect("owner.jsp?msg=wrongpassword");
              }
          }
          else{
              response.sendRedirect("owner.jsp?msg=failed");          }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ownerlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ownerlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
