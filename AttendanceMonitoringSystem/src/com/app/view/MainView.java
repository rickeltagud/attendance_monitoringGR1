/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.view;


import java.util.Scanner;


public class MainView {
    private static final int CONSOLE_WIDTH = 80;
    // ANSI escape codes for coloring text
    public static final String RESET = "\u001B[0m";
    public static final String RED = "\u001B[31m";
    public static final String GREEN = "\u001B[32m";
    public static final String YELLOW = "\u001B[33m";
    public static final String BLUE = "\u001B[34m";
    public static final String PURPLE = "\u001B[35m";
    public static final String CYAN = "\u001B[36m";
    public static final String WHITE = "\u001B[37m";

    
    
    public void viewAdminApp(){
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
        System.out.println(BLUE + "\t\t\t\tPlease select an option from the menu below:" + RESET);
        System.out.println(PURPLE +  "\t\t\t\t\t\t1. schedule");
        System.out.println(PURPLE + "\t\t\t\t\t\t2. department");
        System.out.println(PURPLE + "\t\t\t\t\t\t3. user");
        System.out.println(PURPLE + "\t\t\t\t\t\t4. attendance");
        System.out.println(PURPLE + "\t\t\t\t\t\t5. Exit");
        System.out.println();

        System.out.print(centerString("Enter a choice: "));
        try {
            int choice = scan.nextInt();
            switch (choice) {
                case 1:
                      
                     AttendanceView scheduleview = new AttendanceView();
                     scheduleview.viewSchedule();
                    // Call Temporary View for schedule Table
                    
                    break;
                case 2:
                    // Call Temporary View for department Table
                    break;
                case 3:
                    // Call Temporary View for user Table
                    break;
                case 4:
                    // Call Temporary View for attendance Table
                    AttendanceView attendanceview = new AttendanceView();
                    attendanceview.attendanceView();
                    break;
                case 5:
                    // Exit the program
                    break;
                default:
                    UserChoice();
            }
        } catch (Exception e) {
            System.out.println("Please enter a valid integer for the choice.");
            scan.nextLine();
            viewAdminApp();
        }
    }//UserChoice
}