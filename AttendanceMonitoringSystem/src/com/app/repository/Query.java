/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.app.repository;

/**
 *
 * @author Windows 10
 */
public interface Query {
            //FIELD FOR DB CONNECTION
          static String URL = "jdbc:mysql://localhost:3306/attend_monitor_sys";
          static String USERNAME = "root";
          static String PASSWORD = "";
          static String DRIVER = "com.mysql.jdbc.Driver";
          
          //QUERY ATTENDANCE  API
          String VIEW_ATTENDANCE = "SELECT * FROM tbl_attendance";
          String VIEW_ALL_ATTENDANCE  = "SELECT tbl_attendance.attendance_id, tbl_attendance.first_name, tbl_attendance.last_name, tbl_schedule.sched_start, "
                    + "tbl_department.department_name, tbl_user.username, tbl_attendance.in_time, tbl_attendance.out_time "
                    +"FROM tbl_attendance "
                    + "INNER JOIN tbl_schedule ON tbl_attendance.schedule_id  = tbl_schedule.schedule_id "
                    +" INNER JOIN tbl_department ON tbl_attendance.department_id = tbl_department.department_id "
                    + "INNER JOIN tbl_user ON tbl_attendance.user_id  = tbl_user.user_id "
                    + "WHERE archived = 0 ";
          
          String SEARCH_USER = "SELECT tbl_attendance.attendance_id , tbl_attendance.first_name, tbl_schedule.sched_start, "
                    + "tbl_department.department_name, tbl_user.username, tbl_attendance.in_time, tbl_attendance.out_time "
                    +"FROM tbl_attendance "
                    + "INNER JOIN tbl_schedule ON tbl_attendance.schedule_id  = tbl_schedule.schedule_id "
                    +" INNER JOIN tbl_department ON tbl_attendance.department_id   = tbl_department.department_id "
                    + "INNER JOIN tbl_user ON tbl_attendance.user_id = tbl_user.user_id "
                    + "WHERE first_name LIKE ? AND archived = 0 ";
          
          
          String ADD_USER = "INSERT INTO tbl_attendance (first_name, last_name, user_id, department_id, "
            + "schedule_id ) VALUES (?,?,?,?,?)"; //in_time, out_time
                //anti SQL INJECTION
          String UPDATE_USER = "UPDATE tbl_attendance SET  first_name = ? WHERE attendance_id = ? ";
          String DELETE_USER = "DELETE FROM  tbl_attendance WHERE attendance_id = ? ";
          String ARCHIVED_USER = "UPDATE tbl_attendance SET archived = 1 WHERE attendance_id = ?";
          String RETRIEVE_USER = "UPDATE tbl_attendance SET archived = 0 WHERE attendance_id = ?";
          
          String VIEW_ALL_ARCHIVED = "SELECT tbl_attendance.attendance_id, tbl_attendance.first_name, tbl_schedule.sched_start, "
                    + "tbl_department.department_name, tbl_user.username, tbl_attendance.in_time, tbl_attendance.out_time "
                    +"FROM tbl_attendance "
                    + "INNER JOIN tbl_schedule ON tbl_attendance.schedule_id  = tbl_schedule.schedule_id   "
                    +" INNER JOIN tbl_department ON tbl_attendance.department_id  = tbl_department.department_id "
                    + "INNER JOIN tbl_user ON tbl_attendance.user_id = tbl_user.user_id "
                    + "WHERE archived = 1 ";
          
          //QUERY USER_TIME RECORD  API
          
          String VIEW_TIMERECORD =  "SELECT tbl_attendance.attendance_id, tbl_attendance.first_name, tbl_attendance.last_name, tbl_schedule.sched_start, "
                    + "tbl_department.department_name, tbl_user.username, tbl_attendance.in_time, tbl_attendance.out_time "
                    +"FROM tbl_attendance "
                    + "INNER JOIN tbl_schedule ON tbl_attendance.schedule_id  = tbl_schedule.schedule_id "
                    +" INNER JOIN tbl_department ON tbl_attendance.department_id = tbl_department.department_id "
                    + "INNER JOIN tbl_user ON tbl_attendance.user_id  = tbl_user.user_id "
                    + "WHERE archived = 0 ";

            //QUERY USER  API
            
          String CREATE_ACCOUNT = "INSERT INTO tbl_user (username, password, user_type) "
                + "VALUES (?,?,?)";
          
          String LOG_IN = "SELECT  username, password, user_type FROM tbl_user WHERE  username =? AND password = ? AND user_type = ?"; //archived = 0;
          
          String VIEW_LAST_CREATE_ACCOUNT = "SELECT * FROM tbl_user WHERE user_id = (SELECT MAX(user_id) FROM tbl_user)"; //VIEW LAST CREATED/RECORD FROM DATABASE
          
          String ADD_USER_PROFILE = "INSERT INTO tbl_attendance (first_name, last_name, user_id, department_id, "
            + "schedule_id ) VALUES (?,?,?,?,?)"; //in_time, out_time
          
          
           //QUERY DEPARTMENT  API
          
          String VIEW_DEPARTMENT = "SELECT * FROM tbl_department";
          
          
          //QUERY DEPARTMENT  API   
            
          String VIEW_SCHEDULE = "SELECT * FROM tbl_schedule";
          
          //QUERY TIME_IN  API
          
           
          String COMPARE_TIME  = "SELECT * FROM  tbl_schedule  WHERE schedule_id = ? ";
          
          String COMPARE_USER_ID  = "SELECT user_id FROM tbl_user WHERE user_id = '?' ";
          
          
          String ADD_TIME_IN  = "UPDATE tbl_attendance SET  in_time = ? WHERE user_id = ? "; //in_time, out_time
          
           
          
          
          
    
}
