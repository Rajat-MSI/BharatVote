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
public class ElectionDAO 
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
    
    public void saveElection(Election election)
    { 
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            session.save(election);
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
    
    public String getElection(String column,String electionID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT "+ column +" FROM Election WHERE electionID = :electionID";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("electionID",electionID);
            return query.uniqueResult();
        }
        catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Election> getAllElections() 
    {
        try( Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT e FROM Election e", Election.class).list();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
//    public void updateVoter(Voter voter)
//    {
//        try(Session session = HibernateUtility.getSessionFactory().openSession();)
//        {
//            Transaction transaction = session.beginTransaction();
//            session.update(voter);
//            transaction.commit();
//            setProcessed(true);
//            session.close();
//        }
//        catch(Exception e)
//        {
//            e.printStackTrace();
//            setProcessed(false);
//        }
//    }
    
//    public void updateVoter(String data,String column,String voterID)
//    {
//        try(Session session = HibernateUtility.getSessionFactory().openSession())
//        {
//            Transaction transaction = session.beginTransaction();
//            String hql = "UPDATE Voter SET " + column + " = :data WHERE voterID = :voterID";
//            Query query = session.createQuery(hql);
//            query.setParameter("data", data);
//            query.setParameter("voterID", voterID);
//            
//            query.executeUpdate();
//            transaction.commit();
//            setProcessed(true);
//            session.close();
//        }
//        catch(Exception e)
//        {
//            setProcessed(false);
//            e.printStackTrace();
//        }
//    }
    
    public void deleteElection(String electionID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            String hql = "DELETE FROM Election WHERE electionID = :electionID";
            Query query = session.createQuery(hql);
            query.setParameter("electionID",electionID);
            
            query.executeUpdate();
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
}
