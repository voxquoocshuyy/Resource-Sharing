/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quoc Huy
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String ERROR = "error.jsp";
    private static final String CREATE = "CreateController";
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCH = "ViewResourceController";
    private static final String USERGETALLREQUEST = "UserViewRequestController";
    private static final String USERSEARCHREQUEST = "UserSearchRequestController";
    private static final String SEARCHREQ = "SearchRequestController";
    private static final String REQUEST = "RequestController";
    private static final String CANCELREQUEST = "CancelRequestController";
    private static final String CHANGESTATUS = "ChangeStatusRequestController";


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
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            log(action);
            if ("Login".equals(action)) {
                url = LOGIN;
            }
            if ("Create".equals(action)) {
                url = CREATE;
            }
            if ("Logout".equals(action)) {
                url = LOGOUT;
            }
            if ("Search".equals(action)) {
                url = SEARCH;
            }
            if ("Request".equals(action)) {
                url = REQUEST;
            }
            if ("Accept".equals(action)) {
                url = CHANGESTATUS;
            }
            if ("Delete".equals(action)) {
                url = CHANGESTATUS;
            }
            if ("SearchReq".equals(action)) {
                url = SEARCHREQ;
            }
            if ("View Request".equals(action)) {
                url = USERGETALLREQUEST;
            }
            if ("Search Request".equals(action)) {
                url = USERSEARCHREQUEST;
            }
            if ("Cancel Request".equals(action)) {
                url = CANCELREQUEST;
            }

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
