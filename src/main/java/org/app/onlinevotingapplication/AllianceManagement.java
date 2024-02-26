/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;
import java.util.*;
/**
 *
 * @author rajat
 */
public class AllianceManagement 
{
    public List<Alliance> getAllianceList()
    {
        AllianceDAO allianceDAO = new AllianceDAO();
        List<Alliance> list = allianceDAO.getAlliances();
        return list;
    }
    
    public Alliance getAllianceDetails(String allianceID)
    {
        Alliance alliance = new Alliance();
        AllianceDAO allianceDAO = new AllianceDAO();
        
        alliance.setAllianceID(allianceDAO.getAlliance("allianceID", allianceID));
        alliance.setAllianceName(allianceDAO.getAlliance("allianceName", allianceID));
        return alliance;
    }
    
}
