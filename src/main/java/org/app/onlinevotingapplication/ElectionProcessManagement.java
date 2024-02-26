/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.util.List;

/**
 *
 * @author rajat
 */
public class ElectionProcessManagement 
{
    public boolean registerElectionProcess(ElectionProcess electionProcess) 
    {
        ElectionProcessDAO electionProcessDAO = new ElectionProcessDAO();
        electionProcessDAO.saveElectionProcess(electionProcess);
        boolean processed = electionProcessDAO.isProcessed();
        System.out.println("ElectionProcess Registered");
        return processed;
    }
    public List<ElectionProcess> getAllElectionProcessList(String electionID) {
        ElectionProcessDAO electionProcessDAO = new ElectionProcessDAO();
        List<ElectionProcess> electionProcessList = electionProcessDAO.getAllElectionProcess(electionID);
        return electionProcessList;
    }
}
