
package com.app.view;

import com.app.controller.AttendanceController;
import com.app.controller.ScheduleController;
import com.app.model.Attendance;
import com.app.model.Department;
import com.app.model.Schedule;
import com.app.model.User;
import java.util.Scanner;


public class AttendanceView {
   
    Scanner scan = new Scanner(System.in);
    AttendanceController attendControl = new AttendanceController();
    ScheduleController  SchedControl = new ScheduleController();
    
    
       public void addUserView(){
        Attendance attendance = new Attendance();
        Schedule schedule = new Schedule();
        Department department = new Department();     
        User user = new User();
        
        
        System.out.println("\t\t\t\t\t\t Enter FirstName: ");
              attendance.setFirstName(scan.nextLine()); 
              
              System.out.println("\t\t\t\t\t\t Enter LastName: ");
              attendance.setLastName(scan.nextLine());
              
              System.out.println("\t\t\t\t\t\t Enter User id: ");
              user.setUserId(scan.nextInt());
              
              System.out.println("\t\t\t\t\t\t Enter department id: ");
              department.setDepartmentId(scan.nextInt());          
              
              System.out.println("\t\t\t\t\t\t Enter Schedule id: ");
              schedule.setScheduleId(scan.nextInt());                     
              scan.nextLine(); // for bug scanner
              
//              System.out.println("Enter time in: ");              
//              attendance.setInTime(scan.nextLine());
//              
//              System.out.println("Enter time out: ");
//              attendance.setOutTime(scan.nextLine());
//              
//              System.out.println("Enter Archived Number: for Archived 1 and recover 0 : ");
//              attendance.setArchived(scan.nextInt());

           //f.addUser(new Attendance(), new Schedule(), new Department(), new User()); // old          
             //f.addUser(new Attendance(),new User(),new Department(),new Schedule()); // <-- constructor new instance tinatawag new object
             attendControl.addUser(attendance, user, department, schedule);
             
    } 
   
       public void searchUserView(){
        Attendance attendance = new Attendance();
        System.out.print("\t\t\t\t\t\t Enter Firstname that you want to search: ");
        String userKeyword = scan.nextLine();
        attendControl.searchUser(userKeyword);
    }
    
    public void UpdateUserView(){
        Attendance attendance = new Attendance();
        
        System.out.print("\t\t\t\t\t\t Enter FirstName to Update: ");
        attendance.setFirstName(scan.nextLine());
        
        System.out.println("\t\t\t\t\t\t Enter ID to udpate: ");
        attendance.setAttendanceId(scan.nextInt());
    }
    
    
    
    
    public void attendanceView(){      
        Attendance attendance = new Attendance();  
        boolean running = true;
        while(running){
            System.out.println("\t\t\t\t\t\t **********  SELECT **********");
            System.out.println("\t\t\t\t\t\t     [1] View All attendance");
            System.out.println("\t\t\t\t\t\t     [2] Search User");
            System.out.println("\t\t\t\t\t\t     [3] Add User");
            System.out.println("\t\t\t\t\t\t     [4] Update User");
            System.out.println("\t\t\t\t\t\t     [5] Archive User");
            System.out.println("\t\t\t\t\t\t     [6] Delete User");
            System.out.println("\t\t\t\t\t\t     [7] Retrieve User");
            System.out.println("\t\t\t\t\t\t     [8] Back");
            System.out.println("\t\t\t\t\t\t     [9] Exit");
            System.out.println("\t\t\t\t\t\t Enter a choice: ");
            
            try {
                String choice =  scan.nextLine();
                
                switch(choice){
                    case "1":
                        attendControl.viewAttendance(attendance);
                        break;
                    case "2":
                         searchUserView();;
                        break;
                    case "3":
                        addUserView();
                        break;
                    case "4":
                        UpdateUserView();
                        break;
                        case "8":
                        attendanceView();
                    case "9":
                        running = false;
                        
                }
            } catch (Exception e) {
            }
        
        }//while
        
    }//AttendanceView
    
    public void myAttendanceView(){
    Attendance attendance = new Attendance();
    Schedule schedule = new Schedule();
    Department department = new Department();     
    User user = new User();
        
        attendControl.viewMyAttendance(attendance, schedule, department, user);
    }
    
    
    public void viewSchedule(){
        Schedule schedule = new Schedule();     
        
        SchedControl.viewSchedule(schedule);
        
    } //ScheduleView
    
    
    
    
    
    
    
    
    
    
}//class AttendanceView
    
    
    
    
    

