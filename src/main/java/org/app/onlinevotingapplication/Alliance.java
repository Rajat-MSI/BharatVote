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
@Table(name = "alliance")
public class Alliance 
{
    @Id
    @Column(name = "alliance_id")
    private String allianceID;
    
    @Column(name = "alliance_name")
    private String allianceName;

    public String getAllianceID() {
        return allianceID;
    }

    public void setAllianceID(String allianceID) {
        this.allianceID = allianceID;
    }

    public String getAllianceName() {
        return allianceName;
    }

    public void setAllianceName(String allianceName) {
        this.allianceName = allianceName;
    }
}
