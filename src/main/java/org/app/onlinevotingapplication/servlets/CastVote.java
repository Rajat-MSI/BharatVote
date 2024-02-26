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
import org.app.onlinevotingapplication.ElectionProcess;
import org.app.onlinevotingapplication.ElectionProcessManagement;

/**
 *
 * @author rajat
 */
public class CastVote extends HttpServlet {

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
            String partyID = request.getParameter("party_id");
            String electionID = request.getParameter("election_id");
            String voterID = (String) request.getSession().getAttribute("voter_id");

//            String partyVotes = request.getParameter("voter_id");
            
            ElectionProcess electionProcess = new ElectionProcess();
            ElectionProcessManagement electionProcessManagement = new ElectionProcessManagement();
            
            System.out.println(partyID);
            System.out.println(electionID);
            System.out.println(voterID);
            electionProcess.setPartyID(partyID);
            electionProcess.setElectionID(electionID);
            electionProcess.setPartyVotes(voterID);
            
            
            if(electionProcessManagement.registerElectionProcess(electionProcess))
            {
                request.getSession().setAttribute("election_processed", true);
                response.sendRedirect("voter_dashboard.jsp?voter_id=" + voterID);
            }
            else
            {
                request.getSession().setAttribute("election_processed", false);
                response.sendRedirect("voter_dashboard.jsp?voter_id=" + voterID);
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
