/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author rajat
 */
public class AdministratorManagement 
{
    private boolean checkPassword(String adminPassword,String dbAdminPassword)
    {
        return BCrypt.checkpw(adminPassword,dbAdminPassword);
    }
     
    public int adminAuthentication(String adminID,String adminPassword)
    {
        AdministratorDAO adminDAO = new AdministratorDAO();
        String dbAdminID = adminDAO.getAdministrator("adminID", adminID);
        String dbAdminPassword = adminDAO.getAdministrator("adminPassword", adminID);
        if(adminID.equals(dbAdminID) && checkPassword(adminPassword,dbAdminPassword))
        {
//            System.out.println(dbAdminID);
//            System.out.println(dbAdminPassword);
            return 1;
        }
        return -1;
    }
    
    public Administrator getAdminDetails(String adminID)
    {
        Administrator admin = new Administrator();
        AdministratorDAO adminDAO = new AdministratorDAO();
        
        admin.setAdminID(adminDAO.getAdministrator("adminID", adminID));
        admin.setAdminName(adminDAO.getAdministrator("adminName", adminID));
        admin.setAdminEmail(adminDAO.getAdministrator("adminEmail", adminID));
        return admin;
    }
    
  
    
}
