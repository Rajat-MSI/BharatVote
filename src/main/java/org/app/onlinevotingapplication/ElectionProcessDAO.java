/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author rajat
 */
public class ElectionProcessDAO 
{
    private boolean processed;
    public boolean isProcessed()
    {
        return processed;
    }
    
    public void setProcessed(boolean processed)
    {
        this.processed = processed;
    }
    
    public void saveElectionProcess(ElectionProcess electionProcess)
    { 
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            session.save(electionProcess);
            transaction.commit();
            setProcessed(true);
            session.close();
        }
        catch(Exception e)
        {
            setProcessed(false);
            e.printStackTrace();
        }
    }
    
    public List<ElectionProcess> getAllElectionProcess(String electionID) 
    {
        try( Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT e FROM ElectionProcess e WHERE electionID = :electionID", ElectionProcess.class).setParameter("electionID",electionID).list();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public Long getElectionProcessCount(String electionID,String partyID)
    {
        try( Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT COUNT(partyVotes)  FROM ElectionProcess WHERE electionID = :electionID AND partyID = :partyID";
            Query<Long> query = session.createQuery(hql,Long.class);
            query.setParameter("electionID",electionID);
            query.setParameter("partyID",partyID);
            return query.uniqueResult();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
}
