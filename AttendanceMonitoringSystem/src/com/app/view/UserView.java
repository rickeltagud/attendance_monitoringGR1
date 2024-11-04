/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.view;

import com.app.controller.AttendanceController;
import com.app.controller.DepartmentController;
import com.app.controller.ScheduleController;
import com.app.controller.UserController;
import com.app.model.Attendance;
import com.app.model.Department;
import com.app.model.Schedule;
import com.app.model.User;

import static com.app.view.MainView.GREEN;
import static com.app.view.MainView.RESET;
import java.sql.Time;
import java.util.Date;
import java.util.Scanner;


public class UserView {
    
    Scanner scan = new Scanner(System.in);
    UserController user_control = new UserController();
    AttendanceController attendance_control = new AttendanceController();   
    DepartmentController department_control = new DepartmentController();
    ScheduleController  schedule_control = new ScheduleController();
    
    
    public void loginInView(){ 
        
        printWelcomeMessage();
                        
        boolean running = true;
        while(running){
            
            System.out.println("\t\t\t\t\t\t**********  SELECT **********");
            System.out.println("\t\t\t\t\t\t    [1] Register");
            System.out.println("\t\t\t\t\t\t    [2] Login");
            System.out.println("\t\t\t\t\t\t    [3] Exit");
            
            System.out.print("\t\t\t\t\t\t Enter a choice: ");
            
            try {
                String choice =  scan.nextLine();
                
                switch(choice){
                    case "1":
                        createUserAccountView();
                        break;
                    case "2":
                         logInUserAccountView();
                        break;
                    case "3":
                       running = false;
                        
                                                                             
                        
                } //choice
            } catch (Exception e) {
                System.out.println(e);
            }
        
        }//while
        
    }//loginInView()
    
    
    
    public void timeInView(){        
        printWelcomeMessage();
        
       User user = new User();
       Attendance attendance = new Attendance();
       Schedule schedule = new Schedule();
       Department department = new Department();
       
             Date date = new Date();  
             Time currenTime = new Time(date.getTime());
             String convert = currenTime.toString();
             String myCurrentTime = convertTime(convert);
             
             System.out.println("\t\t\t\t\t\t TIME: " + myCurrentTime +"\n" );
             
       
            
              System.out.print("\t\t\t\t\t\t Enter your Schedule ID: ");
              schedule.setScheduleId(scan.nextInt());
              scan.nextLine(); //bug scanner
//              
             
              
              System.out.print("\t\t\t\t\t\t Enter your userID: ");
              user.setUserId(scan.nextInt());
              scan.nextLine(); //bug scanner
              System.out.println("");
//              System.out.print("Enter your attendance ID: ");
//              attendance.setAttendanceId(scan.nextInt());
              
//              System.out.print("Enter your TIME IN: ");
//              attendance.setInTime(scan.nextLine());
              
       
              attendance_control.timeInUser(schedule,attendance,user);
                            
        
    }//timeInView
            
    
    //CREATE ACCOUNT
    public void createUserAccountView(){
       User user = new User();
       Attendance attendance = new Attendance();
       Schedule schedule = new Schedule();
       Department department = new Department();     
        
        
        
              System.out.print("\t\t\t\t\t\t Enter your Username: ");
              user.setUserName(scan.nextLine()); 
              
              System.out.print("\t\t\t\t\t\t Enter Password: ");
              user.setUserpassword(scan.nextLine());
              System.out.println("\t\t\t\t\t\t     [1] Administrator");
              System.out.println("\t\t\t\t\t\t     [2] User or Client");
              System.out.print("\t\t\t\t\t\t Enter User Type: ");
              user.setUserType(scan.nextInt());
              scan.nextLine();        //bug Scanner                   
              System.out.print(" ");
              user_control.createUserAccount(user);
              
              
              System.out.print("\t\t\t\t\t\t Enter your userID: ");
              attendance.setUserId(scan.nextInt());
              scan.nextLine(); //bug scanner
              
              System.out.print("\t\t\t\t\t\t Enter your FirstName: ");             
              attendance.setFirstName(scan.nextLine());
              
              System.out.print("\t\t\t\t\t\t Enter your LastName: ");
              attendance.setLastName(scan.nextLine());
              
              department_control.ViewDepartment(department);
              
              System.out.print("\t\t\t\t\t\t Enter your Department ID: ");
              department.setDepartmentId(scan.nextInt());
              scan.nextLine(); //bug scanner
              
              schedule_control.viewSchedule(schedule);
              
              System.out.print("\t\t\t\t\t\t Enter your Schedule ID: ");
              attendance.setScheduleId(scan.nextInt());
              
              
              
             attendance_control.addUser(attendance, user, department, schedule);
    
    }
    
    public void logInUserAccountView(){
        
               User user = new User();
        
              System.out.print("\t\t\t\t\t\t Enter User Name: ");
              user.setUserName(scan.nextLine()); 
              
              System.out.print("\t\t\t\t\t\t Enter Password: ");
              user.setUserpassword(scan.nextLine());
              
              System.out.println("\t\t\t\t\t\t   User Type  [1] Administrator");
              System.out.println("\t\t\t\t\t\t   User Type  [2] User or Client");
              System.out.print("\t\t\t\t\t\t Enter User Type Number: ");           
              user.setUserType(scan.nextInt());  
                                                 
              user_control.loginUserAccount(user);
              
              
    
    } //logInUserAccountView
    
    //USER CLIENT MENU OR VIEW
    public void viewUserApp(){
        printWelcomeMessage();
        UserChoice();
    }
    
    
    public void printWelcomeMessage() {
        Scanner scan = new Scanner(System.in);
        System.out.println(  "****************************************************************************************************************************************************************************");
        System.out.println(  "*        __  _____  _____    __  ___  __     __  ___     __    __      __ __   _   __   ___  _____   _   __   ___  ___    ___      ___  _ _   ___ _____    __  __ __       *");
        System.out.println(  "*       /  ||     ||     |  / _]|  \\ ||  \\   /  ||   |   /  ]  / _]    |  |  | / \\ |  \\ |   ||     | / \\ |  \\ |   ||   |  /  _]    /__/ | | | /__/|     |  / _]|  |  |      *");
        System.out.println(  "*      | 0 ||_   _||_   _| / [_ | _ ||   \\ | 0 || _ |  /  /  / [_     |_   _||   || _ | | | |_   _||   || D ) | | | _ | /  /     (  \\_ | | |( \\_ |_   _| / [_ |_   _|      *");
        System.out.println(  "*      |   |  | |    | |  |   _]| | || D  ||   || | | /  /  |   _]    | \\_/ || 0 || | | | |   | |  | 0 ||  /  | | | | ||  |       \\_  || - | \\_ |  | |  |   _]| \\_/ |      *");
        System.out.println(  "*      | _ |  | |    | |  |  [_ | | ||    || | || | |/   \\_ |  [_     |  |  ||   || | | | |   | |  |   || \\   | | | | ||  |__     / \\ ||__ |/ \\ |  | |  |  [_ |  |  |      *");
        System.out.println(  "*      | | |  | |    | |  |    || | ||    || | || | |\\     ||    |    |  |  ||   || | | | |   | |  |   ||  \\  | | | | |\\  o  |    \\   ||   |\\   |  | |  |    ||  |  |      *");
        System.out.println(  "*      |_|_|  |_|    |_|  |____||_|_||___/_|_||_|_|_| \\____||____|    |__|__| \\_/ |_|_||___|  |_|   \\_/ |_|\\_||___||_|_| \\___/      \\__||__/  \\__|  |_|  |____||__|__|      *");
        System.out.println(  "*                                                                                                                                                                          *");
        System.out.println(  "****************************************************************************************************************************************************************************");
            
    }
    
    private String centerString(String str) {
        int CONSOLE_WIDTH = 80;
        int padding = (CONSOLE_WIDTH - str.length()) / 2; // Calculate padding
        StringBuilder centered = new StringBuilder();
        // Append spaces for padding
        for (int i = 0; i < Math.max(0, padding); i++) {
            centered.append(" ");
        }
        centered.append(str); // Append the original string
        return centered.toString();
    }
    
    
    public void UserChoice(){
        Scanner scan = new Scanner(System.in);
        System.out.println("\n");
        System.out.println(GREEN + "\t\t\t\t********** SELECT ********** " + RESET);
        System.out.println(GREEN +  "\t\t\t\t\t\t1. USER PROFILE");
        System.out.println(GREEN + "\t\t\t\t\t\t2. TIME RECORD");
        System.out.println(GREEN + "\t\t\t\t\t\t3. MAKE ATTENDANCE"); 
        System.out.println(GREEN + "\t\t\t\t\t\t4. MAKE VIEW ATTENDANCE"); 
        System.out.println(GREEN + "\t\t\t\t\t\t5. EXIT");
        System.out.println();

        System.out.print(centerString("Enter a choice: "));
        try {
            int choice = scan.nextInt();
            switch (choice) {
                case 1:
                    AttendanceView schedule  = new AttendanceView();
                    schedule.viewSchedule();
                    break;
                case 2:
                    // Call Temporary View for department Table
                    break;
                case 3:
                    timeInView();
                    break;
                case 4:
                    // Call Temporary View for attendance Table
                    AttendanceView attendanceview = new AttendanceView();                   
                    attendanceview.myAttendanceView();
                    
                    break;
                case 5:
                    // Exit the program
                    loginInView();
                    break;
                default:
                // Invalid input (use recursion)
            }
        } catch (Exception e) {
            System.out.println("\t\t\t\t\t\tPlease enter a valid integer for the choice.");
            scan.nextLine();
             UserChoice();
            //viewUserApp();
        }
        UserChoice();
    }
    
    
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
    
    
}//USerView class