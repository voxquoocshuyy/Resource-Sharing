/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tblRequest.RequestDAO;
import tblRequest.RequestDTO;
import tblUsers.UsersDTO;

/**
 *
 * @author Quoc Huy
 */
@WebServlet(name = "UserSearchRequestController", urlPatterns = {"/UserSearchRequestController"})
public class UserSearchRequestController extends HttpServlet {
    private static final String SUCCESS = "viewrequest.jsp";
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
        String content = request.getParameter("content");
        try {
             HttpSession session = request.getSession(false);
            if ( session!= null) {
            UsersDTO dto = (UsersDTO) session.getAttribute("LOGIN_USER");
            String userID = dto.getUserID();           
            String page = request.getParameter("page");          
            if (content == null) {
                content = "";
            }
            int paging = 0;
            if (page != null && page != "") {
                paging = Integer.parseInt(page);
            }
            RequestDAO dao = new RequestDAO();
            List<RequestDTO> list = dao.UserSearch(content, userID, paging);
            int total = dao.userGetTotal(content, userID);
            request.setAttribute("total", total);
            request.setAttribute("LIST_USER_REQUEST", list);
            }
        } catch (Exception e) {
            log("Error at UserSearchrequestController:" + e.getMessage());
        } finally {
            request.getRequestDispatcher(SUCCESS+"?content="+content).forward(request, response);
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
