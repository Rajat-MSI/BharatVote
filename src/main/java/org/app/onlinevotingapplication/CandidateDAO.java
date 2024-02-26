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
public class CandidateDAO {

    private boolean processed;

    public boolean isProcessed() {
        return processed;
    }

    public void setProcessed(boolean processed) {
        this.processed = processed;
    }

    public void saveCandidate(Candidate candidate) {
        try (Session session = HibernateUtility.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(candidate);
            transaction.commit();
            setProcessed(true);
            session.close();
        } catch (Exception e) {
            setProcessed(false);
            e.printStackTrace();
        }
    }

    public String getCandidate(String column, String candidateID) {
        try (Session session = HibernateUtility.getSessionFactory().openSession()) {
            String hql = "SELECT " + column + " FROM Candidate WHERE candidateID = :candidateID";
            Query<String> query = session.createQuery(hql, String.class);
            query.setParameter("candidateID", candidateID);
            return query.uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            return null;
        }
    }

    public List<Candidate> getAllCandidates() {
        try (Session session = HibernateUtility.getSessionFactory().openSession()) {
            return session.createQuery("SELECT c FROM Candidate c", Candidate.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void deleteCandidate(String candidateID) {
        try (Session session = HibernateUtility.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            String hql = "DELETE FROM Candidate WHERE candidateID = :candidateID";
            Query query = session.createQuery(hql);
            query.setParameter("candidateID", candidateID);

            query.executeUpdate();
            transaction.commit();
            setProcessed(true);
            session.close();
        } catch (Exception e) {
            setProcessed(false);
            e.printStackTrace();
        }
    }
    
    public void updateCandidate(String data,String column,String candidateID)
    {
        try(Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            String hql = "UPDATE Candidate SET " + column + " = :data WHERE candidateID = :candidateID";
            Query query = session.createQuery(hql);
            query.setParameter("data", data);
            query.setParameter("candidateID", candidateID);
            
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
    
    public List<Candidate> getPartyCandidates(String candidateParty)
    {
        try (Session session = HibernateUtility.getSessionFactory().openSession())
        {
            Transaction transaction = session.beginTransaction();
            String hql = "SELECT c FROM Candidate c WHERE candidateParty = :candidateParty";
            Query<Candidate> query = session.createQuery(hql, Candidate.class);
            query.setParameter("candidateParty",candidateParty);
            List<Candidate> candidates = query.list();
            transaction.commit();
            return candidates;
        } catch (Exception e) 
        {
            e.printStackTrace();
            return null;
        }
    }
}
