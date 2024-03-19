/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.utility.DBConnectionn;
import com.app.utility.EncryptionAlgoritham;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ramu Maloth
 */
@MultipartConfig(maxFileSize = 16177215)
public class upload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        HttpSession hs=request.getSession();
        int oid=Integer.parseInt(hs.getAttribute("oid").toString());
         
        String ownername = request.getParameter("ownername");
       
        String emailid = request.getParameter("emailid");
         System.out.println(emailid);
        String index = request.getParameter("index");
         System.out.println(index);
        String privatekey=request.getParameter("privatekey");
        //String encfiledata = null;
        BufferedReader reader = null;
        StringBuffer buf;
        InputStream inputStream = null;
        Part filePart = request.getPart("file");
        String filename = getFileName(filePart);
        System.out.println(filename);
        if (filePart != null) {
          
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        String str = "";
        buf = new StringBuffer();
        reader = new BufferedReader(new InputStreamReader(inputStream));
        if (inputStream != null) {
            while ((str = reader.readLine()) != null) {
                buf.append(str + "\n");
            }
        }
        String data = buf.toString();
       
            
      
        InputStream is = new ByteArrayInputStream(data.getBytes());
    
         try
         { 
          String ciphertext=EncryptionAlgoritham.encrypt(data);  
        Connection con=DBConnectionn.getConnection();
        PreparedStatement ps=con.prepareStatement("insert into upload(ownerid, index1, ownername, emailid, file, cipherdata, filename, privatekey) values (?,?,?,?,?,?,?,?)");
                            //ps.setString(1, oid);
                            ps.setInt(1, oid);
                            ps.setString(2, index);
                            ps.setString(3, ownername);
                            ps.setString(4, emailid);
                            ps.setBinaryStream(5, is);
                            ps.setString(6, ciphertext);
                            ps.setString(7, filename);
                            ps.setString(8, privatekey);
                            
          
           int k=ps.executeUpdate();
           if(k>0){
               response.sendRedirect("upload.jsp?msg=success");
           }
           else
           {
                  response.sendRedirect("upload.jsp?msg=failed"); 
           }
        }
        catch(Exception e){
          System.out.println(e); 
        pw.println();
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

    private String getFileName(Part filePart) {
        for (String cd : filePart.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }
}
