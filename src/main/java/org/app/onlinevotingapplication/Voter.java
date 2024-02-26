/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

/**
 *
 * @author rajat
 */
import jakarta.persistence.*;

@Entity
@Table(name = "voter")
public class Voter 
{
    @Id
    @Column(name = "voter_id")
    private String voterID;
    
    @Lob
    @Column(name = "voter_image")
    private byte[] voterImage;
    
    @Column(name = "voter_name")
    private String voterName;
    
    @Column(name = "voter_father_name")
    private String voterFatherName;
    
    @Column(name = "voter_gender")
    private String voterGender;
    
    @Column(name = "voter_dob")
    private String voterDOB;
    
    @Column(name = "voter_state")
    private String voterState;
    
    @Column(name = "voter_district")
    private String voterDistrict;
    
    @Column(name = "voter_phone")
    private String voterPhone;
    
    @Column(name = "voter_address")
    private String voterAddress;
    
    @Column(name = "voter_aadhaar_number")
    private String voterAadhaarNumber;
    
    @Column(name = "voter_password")
    private String voterPassword;
    
    public String getVoterPassword() {
        return voterPassword;
    }

    public void setVoterPassword(String voterPassword) {
        this.voterPassword = voterPassword;
    }

    public String getVoterAadhaarNumber() {
        return voterAadhaarNumber;
    }

    public void setVoterAadhaarNumber(String voterAadhaarNumber) {
        this.voterAadhaarNumber = voterAadhaarNumber;
    }
    
    public String getVoterID() {
        return voterID;
    }

    public void setVoterID(String voterID) {
        this.voterID = voterID;
    }

    public byte[] getVoterImage() {
        return voterImage;
    }

    public void setVoterImage(byte[] voterImage) {
        this.voterImage = voterImage;
    }

    public String getVoterName() {
        return voterName;
    }

    public void setVoterName(String voterName) {
        this.voterName = voterName;
    }

    public String getVoterFatherName() {
        return voterFatherName;
    }

    public void setVoterFatherName(String voterFatherName) {
        this.voterFatherName = voterFatherName;
    }

    public String getVoterGender() {
        return voterGender;
    }

    public void setVoterGender(String voterGender) {
        this.voterGender = voterGender;
    }

    public String getVoterDOB() {
        return voterDOB;
    }

    public void setVoterDOB(String voterDOB) {
        this.voterDOB = voterDOB;
    }

    public String getVoterState() {
        return voterState;
    }

    public void setVoterState(String voterState) {
        this.voterState = voterState;
    }

    public String getVoterAddress() {
        return voterAddress;
    }

    public void setVoterAddress(String voterAddress) {
        this.voterAddress = voterAddress;
    }

    public String getVoterDistrict() {
        return voterDistrict;
    }

    public void setVoterDistrict(String voterDistrict) {
        this.voterDistrict = voterDistrict;
    }

    public String getVoterPhone() {
        return voterPhone;
    }

    public void setVoterPhone(String voterPhone) {
        this.voterPhone = voterPhone;
    }  
}
