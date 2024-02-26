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
@Table(name = "election_process")
public class ElectionProcess 
{
    @Id
    @Column(name = "party_votes")
    private String partyVotes;
    
    @Column(name = "party_id")
    private String partyID;
    
    @Column(name = "election_id")
    private String electionID;

    public String getPartyVotes() {
        return partyVotes;
    }

    public void setPartyVotes(String partyVotes) {
        this.partyVotes = partyVotes;
    }

    public String getPartyID() {
        return partyID;
    }

    public void setPartyID(String partyID) {
        this.partyID = partyID;
    }

    public String getElectionID() {
        return electionID;
    }

    public void setElectionID(String electionID) {
        this.electionID = electionID;
    }

    
}
