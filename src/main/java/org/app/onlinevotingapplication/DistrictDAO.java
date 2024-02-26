/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author rajat
 */
public class DistrictDAO 
{
    public List<District> getAllDistrict()
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            return session.createQuery("SELECT d FROM District d",District.class).list();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public String getDistrict(String column,String districtID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT " + column + " FROM District WHERE districtID = :districtID";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("districtID", districtID);
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
