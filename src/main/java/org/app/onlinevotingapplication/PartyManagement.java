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
public class PartyManagement 
{
    public boolean registerParty(Party party)
    {
        PartyDAO partyDAO = new PartyDAO();
        partyDAO.saveParty(party);
        boolean processed = partyDAO.isProcessed();
        System.out.println("Party Registered");
        return processed;
    }
    
     public Party getPartyDetails(String partyID)
    {
        Party party = new Party();
        PartyDAO partyDAO = new PartyDAO();
        
        party.setPartyID(partyDAO.getParty("partyID", partyID));
        party.setPartyName(partyDAO.getParty("partyName", partyID));
        party.setPartyAbbreviation(partyDAO.getParty("partyAbbreviation",partyID));
        party.setPartySymbol(partyDAO.getParty("partySymbol",partyID));
        party.setPartyLeader(partyDAO.getParty("partyLeader",partyID));
        party.setPartyAlliance(partyDAO.getParty("partyAlliance",partyID));
        return party;
    } 
    
    public List<Party> getPartyList()
    {
        PartyDAO partyDAO = new PartyDAO();
        List<Party> partyList = partyDAO.getAllParties();
        return partyList;
    }
    
    public boolean updatePartyDetails(String data,String column,String partyID)
    {
        PartyDAO partyDAO = new PartyDAO();
        partyDAO.updateParty(data,column,partyID);
        boolean processed = partyDAO.isProcessed();
        return processed;
    }
    
    public boolean deletePartyDetails(String partyID)
    {
        PartyDAO partyDAO = new PartyDAO();
        partyDAO.deleteParty(partyID);
        boolean processed = partyDAO.isProcessed();
        return processed;
    }
}
