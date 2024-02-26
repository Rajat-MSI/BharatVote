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
public class StateManagement 
{
    public List<State> getStateList()
    {
        StateDAO stateDAO = new StateDAO();
        List<State> stateList = stateDAO.getAllStates();
        return stateList;
    }
    
    public State getStateDetails(String stateID)
    {
        State state = new State();
        StateDAO stateDAO = new StateDAO();
        state.setStateID(stateDAO.getState("stateID",stateID));
        state.setStateName(stateDAO.getState("stateName",stateID));
        return state;
    }
}
