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
import javax.servlet.http.HttpSession;
import tblUsers.UsersDAO;
import tblUsers.UsersDTO;
import utils.VerifyUtils;

/**
 *
 * @author Quoc Huy
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    public static final String ERROR = "login.jsp";
    public static final String ADMIN = "ViewRequestController";
    public static final String SUCCESS = "ViewResourceController?name=";
    public static final String VERIFY = "verify.jsp";

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
        boolean valid = false;
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            UsersDAO dao = new UsersDAO();
            UsersDTO user = dao.checkLogin(userID, password);
            HttpSession session = request.getSession();
            if (user != null) {
                session.setAttribute("LOGIN_USER", user);
                String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                valid = VerifyUtils.verify(gRecaptchaResponse);
                if (valid == true) {                 
                    if ("Active".equals(user.getStatus())) {
                        url = SUCCESS;
                    } else {
                        request.setAttribute("NotiUserNotActive", "User not active !");
                        url = VERIFY;
                    }
                    if ((user.getRoleID()) == 1) {
                        url = ADMIN;
                    }
                } else {
                    url = ERROR;
                    request.setAttribute("NotiRecapcha", "Recapcha invalid!");
                }
            } else {
                request.setAttribute("NOTI", "User is not found");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
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
