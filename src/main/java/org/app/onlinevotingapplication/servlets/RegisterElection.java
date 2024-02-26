/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.app.onlinevotingapplication.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.app.onlinevotingapplication.Election;
import org.app.onlinevotingapplication.ElectionManagement;

/**
 *
 * @author rajat
 */
public class RegisterElection extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            /* TODO output your page here. You may use following sample code. */
            String electionID = request.getParameter("election_id");
            String electionType = request.getParameter("election_type");
            String electionStartDate = request.getParameter("election_start_date");
            String electionEndDate = request.getParameter("election_end_date");
            String electionStartTime = request.getParameter("election_start_time");
            String electionEndTime = request.getParameter("election_end_time");
            
            Election election = new Election();
            election.setElectionID(electionID);
            election.setElectionType(electionType);
            election.setElectionStartDate(electionStartDate);
            election.setElectionEndDate(electionEndDate);
            election.setElectionStartTime(electionStartTime);
            election.setElectionEndTime(electionEndTime);
            
            ElectionManagement electionManagement = new ElectionManagement();

            if(electionManagement.registerElection(election))
            {
                request.getSession().setAttribute("election_registration", true);
                response.sendRedirect("election_management.jsp");
            }
            else
            {
                request.getSession().setAttribute("election_registration",false);
                response.sendRedirect("election_management.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
