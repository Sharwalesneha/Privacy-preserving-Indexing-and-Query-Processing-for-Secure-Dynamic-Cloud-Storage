 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.utility;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author JAVA
 */
public class DBConnectionn {
     public static Connection con=null;
        public static  Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dynamic","root","root");
            if(con!=null){
                return con;
            }
            else{
             return con;
            }}
        catch(Exception e){
            System.out.println(e);
        }
    return con;}
    
}
