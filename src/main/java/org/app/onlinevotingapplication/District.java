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
@Table(name = "district")
public class District 
{
    @Id
    @Column(name = "district_id")
    private String districtID;
    
    @Column(name = "district_name")
    private String districtName;
    
    @Column(name = "state_id")
    private String state_id;

    public String getDistrictID() {
        return districtID;
    }

    public void setDistrictID(String districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getState_id() {
        return state_id;
    }

    public void setState_id(String state_id) {
        this.state_id = state_id;
    }
}


