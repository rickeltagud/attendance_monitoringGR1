/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.model;

/**
 *
 * @author Windows 10
 */
public class Schedule {
    
            private int scheduleId;
            private String schedStart;
            private String schedEnd;
            private long timeIn;
            
    
       public Schedule(){
       
       }   
            
    public Schedule(int scheduleId, String schedStart, String schedEnd, long timeIn) {
        this.scheduleId = scheduleId;
        this.schedStart = schedStart;
        this.schedEnd = schedEnd;
    }
            
            
    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getSchedStart() {
        return schedStart;
    }

    public void setSchedStart(String schedStart) {
        this.schedStart = schedStart;
    }

    public String getSchedEnd() {
        return schedEnd;
    }

    public void setSchedEnd(String schedEnd) {
        this.schedEnd = schedEnd;
    }

   //TIME IN

    public long getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(long timeIn) {
        this.timeIn = timeIn;
    }
    
    
    
            
            
            
            
            
            
}//Schedule
