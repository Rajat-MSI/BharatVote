/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.app.onlinevotingapplication.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.app.onlinevotingapplication.*;

/**
 *
 * @author rajat
 */
@MultipartConfig
public class RegisterCandidate extends HttpServlet {

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
            Candidate candidate = new Candidate();
            CandidateManagement candidateManagement = new CandidateManagement();
            ProcessImage image = new ProcessImage();
            
            String candidateID = request.getParameter("candidate_id");
            String candidateName = request.getParameter("candidate_name");
            String candidateFatherName = request.getParameter("candidate_father_name");
            String candidateParty = request.getParameter("candidate_party");
            String candidatePhone = request.getParameter("candidate_phone");
            String candidateAadhaar = request.getParameter("candidate_aadhaar");
            String candidateGender = request.getParameter("candidate_gender");
            String candidateDOB = request.getParameter("candidate_dob");
            String candidateState = request.getParameter("candidate_state");
            String candidateDistrict = request.getParameter("candidate_district");
            String candidateAddress = request.getParameter("candidate_address");
            String candidateDesignation = request.getParameter("candidate_designation");
            
            Part filePart = request.getPart("set-image");
            
            try
            {
                long imageSize = filePart.getSize();
                byte[] imageData = image.processImage(filePart);
                candidate.setCandidateImage(imageData);
            }
            catch(Exception e)
            {
                System.out.println(e);
                e.printStackTrace();
            }
            
            candidate.setCandidateID(candidateID);
            candidate.setCandidateName(candidateName);
            candidate.setCandidateFatherName(candidateFatherName);
            candidate.setCandidateParty(candidateParty);
            candidate.setCandidatePhone(candidatePhone);
            candidate.setCandidateAadhaarNumber(candidateAadhaar);
            candidate.setCandidateGender(candidateGender);
            candidate.setCandidateDOB(candidateDOB);
            candidate.setCandidateState(candidateState);
            candidate.setCandidateDistrict(candidateDistrict);
            candidate.setCandidateAddress(candidateAddress);
            candidate.setCandidateDesignation(candidateDesignation);
            
            if(candidateManagement.registerCandidate(candidate))
            {
                request.getSession().setAttribute("candidate_registration", true);
                response.sendRedirect("candidate_management.jsp");
            }
            else
            {
                request.getSession().setAttribute("candidate_registration",false);
                response.sendRedirect("candidate_management.jsp");
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
