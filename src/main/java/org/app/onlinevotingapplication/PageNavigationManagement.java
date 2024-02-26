/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

/**
 *
 * @author rajat
 */
public class PageNavigationManagement 
{
    public DashboardNavigations getDashboardNavigation()
    {
        DashboardNavigations navigation = new DashboardNavigations();
        
        navigation.setNavBlock1("Manage Elections");
        navigation.setNavBlock2("Manage Voters");
        navigation.setNavBlock3("Manage Candidates");
        navigation.setNavBlock4("Manage Political Parties");
        navigation.setNavBlock5("Result Panel");
        navigation.setNavBlock6("Alliance Panel");
        
        return navigation;
    }
}
