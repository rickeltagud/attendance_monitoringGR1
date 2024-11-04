
package com.app.repository;

import com.app.model.Attendance;
import com.app.model.Department;
import com.app.model.Schedule;
import com.app.model.User;


public interface AttendanceRepository {
    

    // QUERY FOR ATTENDANCE
    public void viewAttendance(Attendance attendance);
    public void viewAttendanceUsingInnerJoin(Attendance attendance, Schedule schedule, Department department, User user);
    public void addUser(Attendance attendance, User user, Department department, Schedule schedule );
    public void searchUser(String UserKeyword);
    public void updateUser(Attendance attendance);
    public void deleteUser(Attendance attendance);
    public void archiveUser(Attendance attendance);
    public void retrieveUser(Attendance attendance);
    public void viewUserArchivedUsingInnerJoin();
    
    // QUERY FOR USER ATTENDANCE
    public void viewMyAttendance(Attendance attendance, Schedule schedule, Department department, User user);
    
    
    // QUERY FOR USER TIME IN ATTENDANCE
    public void timeInUser( Schedule schedule, Attendance attendance, User user);
    
    
}
