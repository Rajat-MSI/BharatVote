/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author rajat
 */
public class ElectionManagement 
{
     public boolean registerElection(Election election) {
        ElectionDAO electionDAO = new ElectionDAO();
        electionDAO.saveElection(election);
        boolean processed = electionDAO.isProcessed();
        System.out.println("Election Registered");
        return processed;
    }

    public Election getElectionDetails(String electionID) throws IOException {
        Election voter = new Election();
        ElectionDAO electionDAO = new ElectionDAO();
       
        voter.setElectionID(electionDAO.getElection("electionID", electionID));
        voter.setElectionType(electionDAO.getElection("electionType", electionID));
        voter.setElectionStartTime(electionDAO.getElection("electionStartTime", electionID));
        voter.setElectionEndTime(electionDAO.getElection("electionEndTime", electionID));
        voter.setElectionStartDate(electionDAO.getElection("electionStartDate", electionID));
        voter.setElectionEndDate(electionDAO.getElection("electionEndDate", electionID));

        return voter;
    }

    public List<Election> getElectionList() {
        ElectionDAO electionDAO = new ElectionDAO();
        List<Election> electionList = electionDAO.getAllElections();
        return electionList;
    }

    public boolean updateVoterDetails(String data, String column, String voterID) {
        VoterDAO voterDAO = new VoterDAO();
        voterDAO.updateVoter(data, column, voterID);
        boolean processed = voterDAO.isProcessed();
        return processed;
    }

 

    public boolean deleteElectionDetails(String electionID) {
        ElectionDAO electionDAO = new ElectionDAO();
        electionDAO.deleteElection(electionID);
        boolean processed = electionDAO.isProcessed();
        return processed;
    }
}
