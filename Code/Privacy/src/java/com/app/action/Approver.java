/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ramu Maloth
 */
@WebServlet("/Approver")

public class Approver extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        String privatekey = request.getParameter("privatekey");
        
        
        System.out.println(privatekey);
     
        //java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        Connection con = null;
        PreparedStatement ps = null;
        try {
         con= DBConnectionn.getConnection();
        String query = "update shareinfo set status='Accepted' where privatekey='"+privatekey+"'";
        ps = con.prepareStatement(query);
        //ps.setString(1,id);
        //ps.setString(2,pswd);
        
        //ps.setDate(10,sqlDate);
        int no = ps.executeUpdate();
        if(no > 0){
        response.sendRedirect("request.jsp?msg=success");
        }else{
        response.sendRedirect("request.jsp?msg=failed");
        }
        } catch(Exception e){
            System.out.println("Error at User registeer "+e.getMessage());
        response.sendRedirect("request.jsp.jsp?msg=faild");
        }finally {            
            out.close();
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
