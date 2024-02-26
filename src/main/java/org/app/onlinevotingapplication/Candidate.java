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
@Table(name = "candidate")
public class Candidate 
{
    @Id
    @Column(name = "candidate_id")
    private String candidateID;
    
    @Lob
    @Column(name = "candidate_image")
    private byte[] candidateImage;
    
    @Column(name = "candidate_name")
    private String candidateName;
    
    @Column(name = "candidate_father_name")
    private String candidateFatherName;
    
    @Column(name = "candidate_party")
    private String candidateParty;
    
    @Column(name = "candidate_phone")
    private String candidatePhone;
    
    @Column(name = "candidate_aadhaar_number")
    private String candidateAadhaarNumber;
    
    @Column(name = "candidate_gender")
    private String candidateGender;
    
    @Column(name = "candidate_dob")
    private String candidateDOB;
    
    @Column(name = "candidate_district")
    private String candidateDistrict;
    
    @Column(name = "candidate_state")
    private String candidateState;
    
    @Column(name = "candidate_address")
    private String candidateAddress;
    
    @Column(name = "candidate_designation")
    private String candidateDesignation;

    public String getCandidateDesignation() {
        return candidateDesignation;
    }

    public void setCandidateDesignation(String candidateDesignation) {
        this.candidateDesignation = candidateDesignation;
    }

    public String getCandidateID() {
        return candidateID;
    }

    public void setCandidateID(String candidateID) {
        this.candidateID = candidateID;
    }

    public byte[] getCandidateImage() {
        return candidateImage;
    }

    public void setCandidateImage(byte[] candidateImage) {
        this.candidateImage = candidateImage;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getCandidateFatherName() {
        return candidateFatherName;
    }

    public void setCandidateFatherName(String candidateFatherName) {
        this.candidateFatherName = candidateFatherName;
    }

    public String getCandidateParty() {
        return candidateParty;
    }

    public void setCandidateParty(String candidateParty) {
        this.candidateParty = candidateParty;
    }

    public String getCandidatePhone() {
        return candidatePhone;
    }

    public void setCandidatePhone(String candidatePhone) {
        this.candidatePhone = candidatePhone;
    }

    public String getCandidateAadhaarNumber() {
        return candidateAadhaarNumber;
    }

    public void setCandidateAadhaarNumber(String candidateAadhaarNumber) {
        this.candidateAadhaarNumber = candidateAadhaarNumber;
    }

    public String getCandidateGender() {
        return candidateGender;
    }

    public void setCandidateGender(String candidateGender) {
        this.candidateGender = candidateGender;
    }

    public String getCandidateDOB() {
        return candidateDOB;
    }

    public void setCandidateDOB(String candidateDOB) {
        this.candidateDOB = candidateDOB;
    }

    public String getCandidateDistrict() {
        return candidateDistrict;
    }

    public void setCandidateDistrict(String candidateDistrict) {
        this.candidateDistrict = candidateDistrict;
    }

    public String getCandidateState() {
        return candidateState;
    }

    public void setCandidateState(String candidateState) {
        this.candidateState = candidateState;
    }

    public String getCandidateAddress() {
        return candidateAddress;
    }

    public void setCandidateAddress(String candidateAddress) {
        this.candidateAddress = candidateAddress;
    }
    
    
    
}
