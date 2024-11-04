
package com.app.model;


public class Attendance {
        //FIELDS
        private int attendanceId;
        private String firstName;	
        private String lastName; 
        private int userId; 
        private int departmentId;
        private int scheduleId; 
        private String  inTime;
        private String  outTime;
        private int archived;

    public Attendance(){
    
    }
        
        public Attendance(int attendanceId, String firstName, String lastName, int userId, int departmentId, int scheduleId, String inTime, String outTime, int archived) {
        this.attendanceId = attendanceId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userId = userId;
        this.departmentId = departmentId;
        this.scheduleId = scheduleId;
        this.inTime = inTime;
        this.outTime = outTime;
        this.archived = archived;
    }
                          

    public int getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getInTime() {
        return inTime;
    }

    public void setInTime(String inTime) {
        this.inTime = inTime;
    }

    public String getOutTime() {
        return outTime;
    }

    public void setOutTime(String outTime) {
        this.outTime = outTime;
    }

    public int getArchived() {
        return archived;
    }

    public void setArchived(int archived) {
        this.archived = archived;
    }

        
    
    
    
    
    
}//Attendance
