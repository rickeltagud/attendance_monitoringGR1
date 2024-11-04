
package com.app.db;

import com.app.repository.Query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public abstract class DBConnection implements Query {
    
        
        public  Connection con;
        public Statement state;
        public ResultSet result;
        public PreparedStatement prep;
        
        public void connect(){
            
            try {
                Class.forName(DRIVER);
                con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
               
            } catch (Exception e) {
                System.out.println(e);   
            }

    }//connect
    
}
