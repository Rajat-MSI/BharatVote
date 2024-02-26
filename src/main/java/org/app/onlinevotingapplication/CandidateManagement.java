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
public class CandidateManagement {

    public boolean registerCandidate(Candidate candidate) {
        CandidateDAO candidateDAO = new CandidateDAO();
        candidateDAO.saveCandidate(candidate);
        boolean processed = candidateDAO.isProcessed();
        System.out.println("Candidate Registered");
        return processed;
    }

    public Candidate getCandidateDetails(String candidateID) {
        Candidate candidate = new Candidate();
        CandidateDAO candidateDAO = new CandidateDAO();

        candidate.setCandidateID(candidateDAO.getCandidate("candidateID", candidateID));
//        candidate.setCandidateID(candidateDAO.getCandidate("candidateImage", candidateID));
        candidate.setCandidateName(candidateDAO.getCandidate("candidateName", candidateID));
        candidate.setCandidateFatherName(candidateDAO.getCandidate("candidateFatherName", candidateID));
        candidate.setCandidateParty(candidateDAO.getCandidate("candidateParty", candidateID));
        candidate.setCandidatePhone(candidateDAO.getCandidate("candidatePhone", candidateID));
        candidate.setCandidateAadhaarNumber(candidateDAO.getCandidate("candidateAadhaarNumber", candidateID));
        candidate.setCandidateGender(candidateDAO.getCandidate("candidateGender", candidateID));
        candidate.setCandidateDOB(candidateDAO.getCandidate("candidateDOB", candidateID));
        candidate.setCandidateState(candidateDAO.getCandidate("candidateState", candidateID));
        candidate.setCandidateDistrict(candidateDAO.getCandidate("candidateDistrict", candidateID));
        candidate.setCandidateAddress(candidateDAO.getCandidate("candidateAddress", candidateID));
        candidate.setCandidateDesignation(candidateDAO.getCandidate("candidateDesignation", candidateID));
        return candidate;
    }

    public List<Candidate> getCandidateList() {
        CandidateDAO candidateDAO = new CandidateDAO();
        List<Candidate> candidateList = candidateDAO.getAllCandidates();
        return candidateList;
    }

    public boolean deleteCandidateDetails(String candidateID) {
        CandidateDAO candidateDAO = new CandidateDAO();
        candidateDAO.deleteCandidate(candidateID);
        boolean processed = candidateDAO.isProcessed();
        return processed;
    }

    public boolean updateCandidateDetails(String data, String column, String candidateID) {
        CandidateDAO candidateDAO = new CandidateDAO();
        candidateDAO.updateCandidate(data, column, candidateID);
        boolean processed = candidateDAO.isProcessed();
        return processed;
    }
    
    public List<Candidate> getPartyCandidateList(String candidateParty)
    {
        CandidateDAO candidateDAO = new CandidateDAO();
        List<Candidate> candidateList = candidateDAO.getPartyCandidates(candidateParty);
        return candidateList;
    }
}
