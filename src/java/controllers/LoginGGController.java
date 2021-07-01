/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tblUsers.UsersDAO;
import tblUsers.UsersDTO;
import utils.GooglePojo;
import utils.GoogleUtils;

/**
 *
 * @author Quoc Huy
 */
@WebServlet(name = "LoginGGController", urlPatterns = {"/LoginGGController"})
public class LoginGGController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SEARCH_PAGE = "ViewResourceController";
    private static final String CREATE = "createuser.jsp";
    public LoginGGController() {
        super();
    }
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
        String url = SEARCH_PAGE;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                request.setAttribute("email", googlePojo.getEmail());
                HttpSession session = request.getSession();
                if (googlePojo != null) {
                    UsersDAO dao = new UsersDAO();
                    UsersDTO user = dao.checkLogin(googlePojo.getEmail());
                    if(user != null)
                    session.setAttribute("LOGIN_USER", user);
                    else {                        
                        url = CREATE + "?email=" + googlePojo.getEmail();
                    }
                }
                RequestDispatcher dis = request.getRequestDispatcher(url);
                dis.forward(request, response);
            }
        } catch (Exception e) {
            log("Error at loginGGcontroller:" + e.getMessage());
        }
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
        doGet(request, response);
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
