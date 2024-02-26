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
@Table(name = "state")
public class State 
{
    @Id
    @Column(name = "state_id")
    private String stateID;
    
    @Column(name = "state_name")
    private String stateName;

    public String getStateID() {
        return stateID;
    }

    public void setStateID(String stateID) {
        this.stateID = stateID;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }
    
    
}
