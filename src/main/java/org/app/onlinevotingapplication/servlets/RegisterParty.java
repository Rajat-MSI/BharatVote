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
public class RegisterParty extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Party party = new Party();
            PartyManagement partyManagement = new PartyManagement();
            ProcessImage image = new ProcessImage();

            String partyID = request.getParameter("party_id");
            String partyName = request.getParameter("party_name");
            String partyAbbreviation = request.getParameter("party_abbreviation");
            String partySymbol = request.getParameter("party_symbol");
            String partyLeader = request.getParameter("party_leader");
            String partyAlliance = request.getParameter("party_alliance");
            Part filePart = request.getPart("set-image");

            try {

                long imageSize = filePart.getSize();
                System.out.println(imageSize);
                byte[] imageData = image.processImage(filePart);
                party.setPartyFlag(imageData);
            } catch (IOException e) {
                out.println(e);
                e.printStackTrace();
            }

            party.setPartyID(partyID);
            party.setPartyName(partyName);
            party.setPartyAbbreviation(partyAbbreviation);
            party.setPartySymbol(partySymbol);
            party.setPartyLeader(partyLeader);
            party.setPartyAlliance(partyAlliance);

            if (partyManagement.registerParty(party)) {
                request.getSession().setAttribute("party_registration", true);
                response.sendRedirect("party_management.jsp");
            } else {
                request.getSession().setAttribute("party_registration", false);
                response.sendRedirect("party_management.jsp");

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
