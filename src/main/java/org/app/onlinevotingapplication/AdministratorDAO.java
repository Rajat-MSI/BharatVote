/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.app.onlinevotingapplication;

/**
 *
 * @author rajat
 */
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AdministratorDAO 
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
    
    public void saveAdministrator(Administrator admin)
    { 
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            session.save(admin);
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
    
    public String getAdministrator(String column,String adminID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            String hql = "SELECT "+ column +" FROM Administrator WHERE adminID = :adminID";
            Query<String> query = session.createQuery(hql,String.class);
            query.setParameter("adminID",adminID);
            return query.uniqueResult();
        }
        catch(Exception e)
        {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
    }
    
//   public List<Administrator> getAllAdministrators()
//   {
//       try(Session session = HibernateUtility.getSessionFactory().openSession())
//       {
//           return session.createQuery("FROM Administrator",Administrator.class).list();
//       }
//        catch(Exception e)
//        {
//            System.out.println(e);
//            e.printStackTrace();
//            return null;
//        }
//       
//   }
    
    
}
