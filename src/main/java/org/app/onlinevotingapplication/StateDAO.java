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
public class StateDAO 
{
    public List<State> getAllStates()
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT s FROM State s",State.class).list();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public String getState(String column,String stateID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT " + column + " FROM State WHERE stateID = :stateID ";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("stateID", stateID);
            return query.uniqueResult();
        }
        catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
    }
}
