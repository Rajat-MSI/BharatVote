/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.util.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author rajat
 */
public class AllianceDAO 
{
    public List<Alliance> getAlliances()
    {
         try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT a FROM Alliance a",Alliance.class).list();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public String getAlliance(String column,String allianceID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT " + column + " FROM Alliance WHERE allianceID = :allianceID";
//            String hql = "SELECT " + column " FROM Alliance WHERE allianceID = :allianceID";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("allianceID",allianceID);
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
