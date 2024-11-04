
package com.app.controller;

import com.app.db.DBConnection;
import com.app.model.Attendance;
import com.app.model.Department;
import com.app.model.Schedule;
import com.app.model.User;
import com.app.repository.AttendanceRepository;
import com.app.repository.Query;

import java.sql.SQLException;
import java.sql.Time;
import java.util.Date;

   
public class AttendanceController extends DBConnection implements AttendanceRepository, Query {
    
    
    //READ API
    @Override
    public void viewAttendance(Attendance attendance){ 
        
        
        //
        try {
            connect(); //physical connection to database
            state = con.createStatement();
            result = state.executeQuery(VIEW_ATTENDANCE);
            
            System.out.println("ID \tFIRSTNAME\t\t\tLASTNAME\tin_time\t\tout_time ");
            System.out.println("===========================================================================================================================");
            while(result.next()){               //extract data db
               attendance.setAttendanceId(result.getInt("attendance_id")); 
               attendance.setFirstName(result.getString("first_name"));
               attendance.setLastName(result.getString("last_name"));
               
                         
               attendance.setInTime(result.getString("in_time"));
               attendance.setOutTime(result.getString("out_time"));
               //connection to view
                System.out.printf("%-2d | %20s | %-18s | %-13s | %-25s \n" 
                , attendance.getAttendanceId(), attendance.getFirstName(), attendance.getLastName(), attendance.getInTime(), attendance.getOutTime());
            }  //while
            con.close();
            
        } catch (Exception e) {
            
            System.out.println(e);
        }
        
    }//ViewAttendance 
    
    //READ API
    @Override
    public void viewAttendanceUsingInnerJoin(Attendance attendance, Schedule schedule, Department department, User user){
        
        
        try {
            connect();
            
            state = con.createStatement();
            result = state.executeQuery(VIEW_ALL_ATTENDANCE);
            
            System.out.println("ID |\tFIRSTNAME\t\t |\tFIRSTNAME\t\t  |sched_start\t\t | department_name\t | username\t\t | in_time\t  | out_time");
            System.out.println("===========================================================================================================================");
            while(result.next()){
               attendance.setAttendanceId(result.getInt("attendance_id")); 
               attendance.setFirstName(result.getString("first_name")); 
               attendance.setLastName(result.getString("last_name")); 
               schedule.setSchedStart(result.getString("sched_start"));
               
               department.setDepartmentName(result.getString("department_name")); 
               user.setUserName(result.getString("username")); 
               attendance.setInTime( result.getString("in_time"));             
               attendance.setOutTime(result.getString("out_time")); 
               
                System.out.printf("%-2d | %7s | %-30s | %-40s | %-25s | %-10s | %-5s\n" 
                , attendance.getAttendanceId(), attendance.getFirstName(), attendance.getLastName(), schedule.getSchedStart(), department.getDepartmentName(), user.getUserName(), attendance.getInTime(),attendance.getOutTime());
                
            }    //while    
            con.close();
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }//ViewAttendanceUsingInnerJoin
    
    
    
    @Override
    public void viewMyAttendance(Attendance attendance, Schedule schedule, Department department, User user){
        
        
        try {
            connect();  
            
            state = con.createStatement();
            result = state.executeQuery(VIEW_TIMERECORD);
            
            System.out.println("\t |FIRSTNAME\t |LASTNAME\t |SCHEDULE\t |TIME_IN\t |TIME_OUT");//| in_time\t  | out_time
            System.out.println("===========================================================================================================================");
            while(result.next()){
            
               attendance.setFirstName(result.getString("first_name")); 
               attendance.setLastName(result.getString("last_name"));
               schedule.setSchedStart(result.getString("sched_start"));
                                       
               attendance.setInTime( result.getString("in_time"));             
               attendance.setOutTime(result.getString("out_time"));     
               
                System.out.printf("\t | %-12s  | %-13s | %-13s | %-14s| %-13s   \n" 
                ,attendance.getFirstName(),attendance.getLastName(),schedule.getSchedStart(), attendance.getInTime(), attendance.getOutTime() ); //attendance.getInTime(),attendance.getOutTime()
                //System.out.println("\t" + attendance.getFirstName() + "\t\t" + attendance.getLastName() + "\t\t" + schedule.getSchedStart() + "\n" );
                
            }    //while
            System.out.println("\n");
            con.close();
            
        } catch (Exception e) {
            //System.out.println(e);
            e.printStackTrace();
        }
        
    }//ViewMyAttendance
    
    
    
    @Override
    public void searchUser(String UserKeyword){
                                   
         try {
            connect();
            prep = con.prepareStatement(SEARCH_USER);
            prep.setString(1, "%" + UserKeyword + "%");
            result = prep.executeQuery();
            
             System.out.println("ID \tFIRSTNAME\t\t\t\tIN_TIME\tOUT_TIME ");
            while(result.next()){               //extract data
               int attendanceId = result.getInt("attendance_id");
               String firstName = result.getString("first_name");              
               String inTime = result.getString("in_time");
               String outTime = result.getString("out_time");
               //connection to view
                System.out.println(attendanceId + "\t" + firstName + "\t\t" + inTime + "\t" + outTime );
            }  //while
            con.close();
            
        } catch (Exception e) {
             System.out.println(e);
        }
    
    } //searchUser
    
    //CREATE API add
    @Override
    public void addUser(Attendance attendance, User user, Department department, Schedule schedule ){
        
    
                
                try {
                 connect();
            
               prep = con.prepareStatement(ADD_USER);
                //setting wild cards values 
               prep.setString(1, attendance.getFirstName());
               System.out.println(attendance.getFirstName());
               prep.setString(2, attendance.getLastName());
               prep.setInt(3, user.getUserId() );
               prep.setInt(4, department.getDepartmentId());
               prep.setInt(5, schedule.getScheduleId());                  
//               prep.setString(6,attendance.getInTime());
//               prep.setString(7, attendance.getOutTime());           
               prep.executeUpdate();
           
                    System.out.println("User " + attendance.getFirstName() + " add successfully ");
                    viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User());
                    
                    con.close();
        } catch (SQLException e) {
                    e.printStackTrace();
        }
                
            }//addUser
    
    //CREATE UPDATE API
    @Override
    public void updateUser(Attendance attendance){
        
        try {
            connect();
            prep = con.prepareStatement(UPDATE_USER);
            
            prep.setString(1, attendance.getFirstName());
            prep.setInt(2, attendance.getAttendanceId());
            
            prep.executeUpdate();
            
            System.out.println("USER " + attendance.getFirstName() + " update successfully");
           viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User());
           con.close();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    
    }//updateUser
    
    //delete API
    @Override
    public void deleteUser(Attendance attendance){
        
        
        try {
            connect();
            prep = con.prepareStatement(DELETE_USER);
            prep.setInt(1, attendance.getAttendanceId());
            prep.executeUpdate();
            System.out.println("USER " + attendance.getAttendanceId() + "  deleted successfully");
          viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User());
            con.close();
        } catch (Exception e) {
        }
    
    }//deleteUser
    
    //ARCHIVED API
    @Override
    public void archiveUser(Attendance attendance) {
        
        try {
            connect();
             prep = con.prepareStatement(ARCHIVED_USER);
             prep.setInt(1, attendance.getAttendanceId());
             prep.executeUpdate();
          viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User());
             System.out.println("User " + attendance.getAttendanceId() + " is archived succesfully");
        } catch (Exception e) {
            System.out.println(e);
        }
    
    }//archiveUser
    
    //retrieveUser
    @Override
    public void retrieveUser(Attendance attendance){
        
        try {
            connect();
             prep = con.prepareStatement(RETRIEVE_USER);
             prep.setInt(1, attendance.getAttendanceId());
             prep.executeUpdate();
            System.out.println("User " + attendance.getAttendanceId() + " is retrieve succesfully");
            viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User());
             
        } catch (Exception e) {
            System.out.println(e);
        }
    
    }//retrieveUser
    
    //display archived
    @Override
    public void viewUserArchivedUsingInnerJoin(){
               
        try {
            connect();
            state = con.createStatement();
            result = state.executeQuery(VIEW_ALL_ARCHIVED);
            
            System.out.println("ID |\tFIRSTNAME\t\t    |sched_start\t\t | department_name\t | username\t\t | in_time\t  | out_time");
            System.out.println("===========================================================================================================================");
            while(result.next()){
               int attendance_id = result.getInt("attendance_id");
               String first_name = result.getString("first_name");
               String sched_start = result.getString("sched_start");
               String department_name = result.getString("department_name");
               String username = result.getString("username");
               String in_time = result.getString("in_time");             
               String out_time = result.getString("out_time");
               
                System.out.printf("%-2d | %7s | %-30s | %-40s | %-25s | %-10s | %-5s\n" 
                , attendance_id, first_name, sched_start, department_name, username, in_time,out_time);
            }    //while
            con.close();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    
}//ViewUserArchivedUsingInnerJoin
    
    @Override
    public void timeInUser( Schedule schedule, Attendance attendance, User user){
           
                
                try {
                connect();
                
                Date date = new Date();         
                //java.sql.Date sqlDate = new java.sql.Date(date.getTime());           
                Time currenTime = new Time(date.getTime());
                                           
                String s1  = currenTime.toString();
                String  convertedTime = convertTime(s1);
                attendance.setInTime(convertedTime);              
                
                prep = con.prepareStatement(COMPARE_TIME);
                prep.setInt(1, schedule.getScheduleId());
                result = prep.executeQuery();
                
             System.out.println("ScheduleId |\t|sched_start ");
             System.out.println("==================================================");
             if(result.next()){
               schedule.setScheduleId(result.getInt("schedule_id"));
               schedule.setSchedStart(result.getTime("sched_start").toString());
               
                System.out.println(schedule.getScheduleId() + "\t" + schedule.getSchedStart() ); 
                
                
                if (currenTime.compareTo(result.getTime("sched_start")) < 0) {
                     String dbTime = result.getTime("sched_start").toString();
                     String convert =  convertTime(dbTime);
                     System.out.println("Schedule time LESS: " + convert);                
                     System.out.println("time in: EARLY " + convertedTime );  
                 
                    prep = con.prepareStatement(ADD_TIME_IN);                                      
                    prep.setString(1,attendance.getInTime());  
                    prep.setInt(2, user.getUserId());                                   
                    prep.executeUpdate();          
                    System.out.println("TIME IN " + attendance.getInTime() + " add successfully ");
                    viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User()); 
                 
                     
                    }
                    //result.getTime("sched_start").compareTo(currenTime
                    else if(currenTime.compareTo(result.getTime("sched_start")) > 0){
                    String dbTime = result.getTime("sched_start").toString();
                    String convert =  convertTime(dbTime);  
                    System.out.println("Schedule time greater: " + convert);
                    System.out.println("time in: LATE :" + convertedTime );
                    
                    prep = con.prepareStatement(ADD_TIME_IN);                                      
                    prep.setString(1,attendance.getInTime());  
                    prep.setInt(2, user.getUserId());                                   
                    prep.executeUpdate();          
                    System.out.println("TIME IN " + attendance.getInTime() + " add successfully ");
                    viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User()); 
                    
                    
                    } //else if
                    
                    else if(currenTime.compareTo(result.getTime("sched_start")) == 0){
                    String dbTime = result.getTime("sched_start").toString();
                    String convert =  convertTime(dbTime);   
                    System.out.println("Schedule time exact: " + convert);
                    System.out.println("time in: ON TIME :" + convertedTime );
                    
                    
                    prep = con.prepareStatement(ADD_TIME_IN);                                      
                    prep.setString(1,attendance.getInTime());  
                    prep.setInt(2, user.getUserId());                                   
                    prep.executeUpdate();          
                    System.out.println("TIME IN " + attendance.getInTime() + " add successfully " + "\n");
                    viewAttendanceUsingInnerJoin(new Attendance(), new Schedule(), new Department(), new User()); 
                    
                     
                    }
                
                
            }  //while        
                                    
                con.close();      
                                                                                       
                    
        } catch (SQLException e) {
                    e.printStackTrace();
        }
                
            }//timeInUser
     
    
    
    
    
     
  
    
     public static String convertTime(String str) {
    // Get Hours
    int h1 = (int)str.charAt(0) - '0';
    int h2 = (int)str.charAt(1) - '0';
    
    int hh = h1 * 10 + h2;
    
    // Finding out the Meridien of time
    String Meridien;
    if (hh < 12) {
        Meridien = "AM";
    } else {
        Meridien = "PM";
    }
    
    hh %= 12;
    
    // Handle 00 and 12 case separately
    StringBuilder result = new StringBuilder();
    if (hh == 0) {
        result.append("12");
    } else {
        result.append(hh);
    }
    
    // Printing minutes and seconds
    for (int i = 2; i < 8; ++i) {
        result.append(str.charAt(i));
    }
    
    // After time is printed, append Meridien
    result.append(" ").append(Meridien);
    
    return result.toString();
}

    
    
    
    
    
    
    
    
    
    
}

    

