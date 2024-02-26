/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import jakarta.persistence.*;

/**
 *
 * @author rajat
 */
@Entity
@Table(name = "administrator")
public class Administrator
{
    @Id
    @Column(name = "admin_id")
    private String adminID;
    
    @Column(name = "admin_name")
    private String adminName;

    @Column(name = "admin_password")
    private String adminPassword;

    @Column(name = "admin_email")
    private String adminEmail;

    public String getAdminID() 
    {
        return adminID;
    }

    public void setAdminID(String adminID) 
    {
        this.adminID = adminID;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) 
    {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword)
    {
        this.adminPassword = adminPassword;
    }

    public String getAdminEmail() 
    {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail)
    {
        this.adminEmail = adminEmail;
    }
    
}
