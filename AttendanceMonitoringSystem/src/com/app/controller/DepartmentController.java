
package com.app.controller;

import com.app.db.DBConnection;
import com.app.model.Department;
import com.app.repository.DepartmentRepository;
import com.app.repository.Query;


public class DepartmentController extends DBConnection implements DepartmentRepository, Query{
    
    @Override
    public void ViewDepartment(Department department){ 
            
        
        try {
            connect(); //physical connection to database
            state = con.createStatement();
            result = state.executeQuery(VIEW_DEPARTMENT);
            
            System.out.println("ID \tDEPARTMENT_NAME ");
            System.out.println("===========================================================================================================================");
            while(result.next()){               //extract data db
               department.setDepartmentId(result.getInt("department_id")); 
               department.setDepartmentName(result.getString("department_name"));                                     
               
               //connection to view
                System.out.printf("%-2d | %20s \n" 
                , department.getDepartmentId(), department.getDepartmentName());
            }  //while
            
            con.close();
            
        } catch (Exception e) {
            
            System.out.println(e);
        }
        
    }//ViewDepartment
    
    
    
    
    
    
    
    
    
    
    
    
    
}
