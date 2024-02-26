/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import com.mysql.cj.jdbc.Blob;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author rajat
 */
public class VoterManagement {

    private boolean checkPassword(String voterPassword, String dbVoterPassword) {
        return BCrypt.checkpw(voterPassword, dbVoterPassword);
    }

    public int voterAuthentication(String voterID, String voterPassword) {
        VoterDAO voterDAO = new VoterDAO();
        String dbVoterID = voterDAO.getVoter("voterID", voterID);
        String dbVoterPassword = voterDAO.getVoter("voterPassword", voterID);
        if (dbVoterID.equals(voterID) && checkPassword(voterPassword, dbVoterPassword)) {
            return 1;
        }
        return -1;
    }

    public boolean registerVoter(Voter voter) {
        VoterDAO voterDAO = new VoterDAO();
        voterDAO.saveVoter(voter);
        boolean processed = voterDAO.isProcessed();
        System.out.println("Voter Registered");
        return processed;
    }

    public Voter getVoterDetails(String voterID) throws IOException {
        Voter voter = new Voter();
        VoterDAO voterDAO = new VoterDAO();
        voter.setVoterID(voterDAO.getVoter("voterID", voterID));
        //how to get voterimage
        voter.setVoterName(voterDAO.getVoter("voterName", voterID));
        voter.setVoterFatherName(voterDAO.getVoter("voterFatherName", voterID));
        voter.setVoterGender(voterDAO.getVoter("voterGender", voterID));
        voter.setVoterDOB(voterDAO.getVoter("voterDOB", voterID));
        voter.setVoterState(voterDAO.getVoter("voterState", voterID));
        voter.setVoterDistrict(voterDAO.getVoter("voterDistrict", voterID));
        voter.setVoterPhone(voterDAO.getVoter("voterPhone", voterID));
        voter.setVoterAddress(voterDAO.getVoter("voterAddress", voterID));
        voter.setVoterAadhaarNumber(voterDAO.getVoter("voterAadhaarNumber", voterID));
        voter.setVoterPassword("");

        return voter;
    }

    public List<Voter> getVoterList() {
        VoterDAO voterDAO = new VoterDAO();
        List<Voter> voterList = voterDAO.getAllVoters();
        return voterList;
    }

    public boolean updateVoterDetails(String data, String column, String voterID) {
        VoterDAO voterDAO = new VoterDAO();
        voterDAO.updateVoter(data, column, voterID);
        boolean processed = voterDAO.isProcessed();
        return processed;
    }

    public boolean searchVoter(String voterID) {
        VoterDAO voterDAO = new VoterDAO();
        String value = voterDAO.getVoter("voterID", voterID);
        return value != null;
    }

    public boolean deleteVoterDetails(String voterID) {
        VoterDAO voterDAO = new VoterDAO();
        voterDAO.deleteVoter(voterID);
        boolean processed = voterDAO.isProcessed();
        return processed;
    }
}
