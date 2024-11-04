/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.app.repository;

import com.app.model.User;

/**
 *
 * @author Windows 10
 */
public interface UserRepository {
    
    public void createUserAccount(User user);
    public void loginUserAccount(User user);
    
}
