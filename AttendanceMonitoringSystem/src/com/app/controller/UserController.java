/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.controller;

import com.app.db.DBConnection;
import com.app.model.User;

import com.app.view.MainView;
import static com.app.view.MainView.GREEN;
import com.app.view.UserView;


public class UserController extends DBConnection{
    
    public void createUserAccount(User user){
        
        
        try {
            connect();
                    prep = con.prepareStatement(CREATE_ACCOUNT);                                     
                    prep.setString(1, user.getUserName());
                    prep.setString(2, user.getUserpassword());
                    prep.setInt(3, user.getUserType());                    
                   
             if(user.getUserName().isEmpty() || user.getUserpassword().isEmpty() || user.getUserType() == 0){
                 String  errorMsg = "Field cannot be Empty.";
                 System.out.println(errorMsg);
             } else{
             
                  prep.executeUpdate();
                  
                  result = prep.executeQuery(VIEW_LAST_CREATE_ACCOUNT);
                  
                  if(result.last()){
                      
                     user.setUserId(result.getInt("user_id"));
                    System.out.println(GREEN +"[ userID: " + user.getUserId() +" ]" + " Username: " + user.getUserName() + " created succesfully!\n"); 
                    
                    } //result.last()
                   con.close();
                  
             }//else 
                               
             
                                     
        } catch (Exception e) {
            System.out.println(e);
        }
    
    }// createUserAccount
    
     public void loginUserAccount(User user){
        
    
        try {
            connect();
            prep = con.prepareStatement(LOG_IN);
            prep.setString(1, user.getUserName());
            prep.setString(2, user.getUserpassword());
            prep.setInt(3, user.getUserType());
            
           
            result = prep.executeQuery();
            if(result.next()){
                int user_type = user.getUserType();
                
                if(user_type == 1){
                System.out.println("Logged In Successfully!");
                //system interface
                MainView mainview = new MainView();
                mainview.viewAdminApp();
                
                }
                else if(user_type == 2){
                System.out.println("not finished " + result.getInt("user_type") + "USER CLIENT");
                //system interface    
                UserView userview = new UserView();
                userview.viewUserApp();
//                
                }
                
                
            }else{
                System.out.println("Logged In  Failed!");
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
    } //loginUserAccount
     
     
     
     
     
}
