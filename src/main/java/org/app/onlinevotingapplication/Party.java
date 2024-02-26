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
@Table(name = "party")
public class Party {

    @Id
    @Column(name = "party_id")
    private String partyID;

    @Lob
    @Column(name = "party_flag")
    private byte[] partyFlag;

    @Column(name = "party_name")
    private String partyName;

    @Column(name = "party_abbreviation")
    private String partyAbbreviation;

    @Column(name = "party_symbol")
    private String partySymbol;

    @Column(name = "party_leader")
    private String partyLeader;

    @Column(name = "party_alliance_id")
    private String partyAlliance;

    public String getPartyID() {
        return partyID;
    }

    public void setPartyID(String partyID) {
        this.partyID = partyID;
    }

    public byte[] getPartyFlag() {
        return partyFlag;
    }

    public void setPartyFlag(byte[] partyFlag) {
        this.partyFlag = partyFlag;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public String getPartyAbbreviation() {
        return partyAbbreviation;
    }

    public void setPartyAbbreviation(String partyAbbreviation) {
        this.partyAbbreviation = partyAbbreviation;
    }

    public String getPartySymbol() {
        return partySymbol;
    }

    public void setPartySymbol(String partySymbol) {
        this.partySymbol = partySymbol;
    }

    public String getPartyLeader() {
        return partyLeader;
    }

    public void setPartyLeader(String partyLeader) {
        this.partyLeader = partyLeader;
    }

    public String getPartyAlliance() {
        return partyAlliance;
    }

    public void setPartyAlliance(String partyAlliance) {
        this.partyAlliance = partyAlliance;
    }
}
