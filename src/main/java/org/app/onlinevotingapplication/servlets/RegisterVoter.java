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
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import org.app.onlinevotingapplication.*;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author rajat
 */

@MultipartConfig
public class RegisterVoter extends HttpServlet 
{

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
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            Voter voter = new Voter();
            VoterManagement voterManagement = new VoterManagement();
            ProcessImage image = new ProcessImage();
            
            String voterID = request.getParameter("voter_id");
            String voterName = request.getParameter("voter_name");
            String voterFatherName = request.getParameter("voter_father_name");
            String voterGender = request.getParameter("voter_gender");
            String voterPhone = request.getParameter("voter_phone");
            String voterDOB = request.getParameter("voter_dob");
            String voterDistrict = request.getParameter("voter_district");
            String voterState = request.getParameter("voter_state");
            String voterAddress = request.getParameter("voter_address");
            String voterAadhaarNumber = request.getParameter("voter_aadhaar");
            try
            {
                Part filePart = request.getPart("set-image");
                byte[] imageData = image.processImage(filePart);
                voter.setVoterImage(imageData);
            }
            catch(ServletException | IOException e)
            {
                out.println(e);
                e.printStackTrace();
            }

            voter.setVoterID(voterID);
            voter.setVoterName(voterName);
            voter.setVoterFatherName(voterFatherName);
            voter.setVoterPhone(voterPhone);
            voter.setVoterGender(voterGender);
            voter.setVoterDOB(voterDOB);
            voter.setVoterState(voterState);
            voter.setVoterDistrict(voterDistrict);
            voter.setVoterAddress(voterAddress);
            voter.setVoterAadhaarNumber(voterAadhaarNumber);
            String password = "";
            for(int i=0;i<voterName.length();i++)
            {
                password += voterName.charAt(i);
                if(String.valueOf(voterName.charAt(i)).equals(" "))
                {
                    break;
                }
            }
            String voterPassword = password.concat(voterDOB).replaceAll(" ","");
            voterPassword = voterPassword.replaceAll("-","");
            String hashedPassword = BCrypt.hashpw(voterPassword, BCrypt.gensalt());
            voter.setVoterPassword(hashedPassword);
            System.out.println(voterPassword);
            if(voterManagement.registerVoter(voter))
            {
                request.getSession().setAttribute("voter_registration", true);
                response.sendRedirect("voter_management.jsp");
            }
            else
            {
                request.getSession().setAttribute("voter_registration", false);
                response.sendRedirect("voter_management.jsp");
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
