
package com.app.controller;

import com.app.db.DBConnection;
import com.app.model.Attendance;
import com.app.model.Department;
import com.app.model.Schedule;
import com.app.model.User;

import com.app.repository.Query;
import com.app.repository.ScheduleRepository;


public class ScheduleController extends DBConnection implements ScheduleRepository, Query {
    
    @Override
    public void viewSchedule(Schedule schedule){ 
            
        
        try {
            connect(); //physical connection to database
            state = con.createStatement();
            result = state.executeQuery(VIEW_SCHEDULE);
            
            System.out.println("ID \tSCHEDULE\t \tsched_start\t \tsched_end");
            System.out.println("===========================================================================================================================");
            while(result.next()){               //extract data db
               schedule.setScheduleId(result.getInt("schedule_id")); 
               
               schedule.setSchedStart(result.getString("sched_start")); 
               
               
               schedule.setSchedEnd(result.getString("sched_end")); 
               
               //connection to view
                System.out.printf("%-2d | %20s | %20s\n" 
                , schedule.getScheduleId(), schedule.getSchedStart(),schedule.getSchedEnd());
            }  //while
            con.close();
            
        } catch (Exception e) {
            
            System.out.println(e);
        }
        
    }//ViewDepartment
    
    //TIME IN
    
    
     
    
    
    
    
}
