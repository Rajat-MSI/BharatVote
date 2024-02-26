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
public class PartyDAO 
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
    
    public void saveParty(Party party)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            session.save(party);
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
    
    public String getParty(String column,String partyID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT " + column + " FROM Party WHERE partyID = :partyID";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("partyID", partyID);
            return query.uniqueResult();
        }
        catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Party> getAllParties()
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT p FROM Party p",Party.class).list();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public void updateParty(String data,String column,String partyID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            String hql = "UPDATE Party SET " + column + " = :data WHERE partyID = :partyID";
            Query query = session.createQuery(hql);
            query.setParameter("data", data);
            query.setParameter("partyID", partyID);
            
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
    
    public void deleteParty(String partyID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            String hql = "DELETE FROM Party WHERE partyID = :partyID";
            Query query = session.createQuery(hql);
            query.setParameter("partyID",partyID);
            
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
