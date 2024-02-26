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
@Table(name = "election")
public class Election 
{
     @Id
    @Column(name = "election_id")
    private String electionID;
    
    @Column(name = "election_type")
    private String electionType;
    
    @Column(name = "election_start_time")
    private String electionStartTime;
    
    @Column(name = "election_end_time")
    private String electionEndTime;
    
    @Column(name = "election_start_date")
    private String electionStartDate;
    
    @Column(name = "election_end_date")
    private String electionEndDate;

    public String getElectionID() {
        return electionID;
    }

    public void setElectionID(String electionID) {
        this.electionID = electionID;
    }

    public String getElectionType() {
        return electionType;
    }

    public void setElectionType(String electionType) {
        this.electionType = electionType;
    }

    public String getElectionStartTime() {
        return electionStartTime;
    }

    public void setElectionStartTime(String electionStartTime) {
        this.electionStartTime = electionStartTime;
    }

    public String getElectionEndTime() {
        return electionEndTime;
    }

    public void setElectionEndTime(String electionEndTime) {
        this.electionEndTime = electionEndTime;
    }

    public String getElectionStartDate() {
        return electionStartDate;
    }

    public void setElectionStartDate(String electionStartDate) {
        this.electionStartDate = electionStartDate;
    }

    public String getElectionEndDate() {
        return electionEndDate;
    }

    public void setElectionEndDate(String electionEndDate) {
        this.electionEndDate = electionEndDate;
    }
}
