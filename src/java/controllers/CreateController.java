/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tblUsers.SendEmail;
import tblUsers.UsersDAO;
import tblUsers.UsersDTO;
import tblUsers.UsersErrorDTO;

/**
 *
 * @author Quoc Huy
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "createuser.jsp";
    private static final String SUCCESS = "verify.jsp";

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
        String userID = request.getParameter("userID");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirm = request.getParameter("confirm");
        UsersErrorDTO userError = new UsersErrorDTO();
        boolean flag = true;

        try {
            if (userID.isEmpty() || (userID.length() < 2 || userID.length() > 10)) {
                userError.setUserIDError("User ID must be [2-10] characters");
                flag = false;
            }
            if (password.isEmpty()) {
                userError.setPasswordError("Password can't empty");
                flag = (false);
            }
            if (confirm.isEmpty()) {
                userError.setConfirmPassword("Confirm password can't empty");
                flag = (false);
            }
            if (password.isEmpty() || !password.equals(confirm)) {
                userError.setConfirmPassword("Confirm password is not match");
                flag = (false);
            }
            if (name.isEmpty() || (name.length() < 5 || name.length() > 15)) {
                userError.setNameError("User name must be [5-15] characters");
                flag = false;
            }
            if (phone.isEmpty() || (phone.length() > 10) || !phone.matches("\\b\\d+\\b")) {
                userError.setPhoneError("Phone must be <= 10 characters");
                flag = false;
            }
            if (address.isEmpty() || (address.length() < 10 || address.length() > 50)) {
                userError.setAddressError("Address must be [10-50] characters");
                flag = false;
            }          
            if (email.isEmpty() || (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) || (email.length() > 50 )) {
                userError.setEmailError("Email not correct format");
                flag = (false);
            }
            SendEmail send = new SendEmail();
            String code = send.getRamdom();
            if (flag) {
                UsersDAO dao = new UsersDAO();
                UsersDTO user = new UsersDTO(userID, password, name, 3, phone, address, null, null, email, code);
                dao.createUser(user);
                SendEmail sendEmail = new SendEmail();
                boolean test = sendEmail.sendEmail(user);
                if (test) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", code);
                    session.setAttribute("LOGIN_USER", userID);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR", userError);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                userError.setUserIDError("UserID is existed");
                request.setAttribute("ERROR", userError);
            }
            log("Error at CreateController:" + e.getMessage());
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
