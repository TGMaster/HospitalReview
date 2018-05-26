/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.PatientDAO;
import Database.BCrypt;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Login extends HttpServlet {

    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();
    private final AdminDAO adminDAO = new AdminDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call session
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        String error;
        boolean adminLogin;
        Admin admin = new Admin();
        Patient patient = new Patient();

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else {
            error = "";
            adminLogin = false;

            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email == null || pass == null) {
                error = "3";
            } else {
                patient = patientDAO.getUserbyEmail(email);

                if (patient.getPass() == null) {
                    error = "1";
                    adminLogin = true;
                } else if (!BCrypt.checkpw(pass, patient.getPass())) {
                    error = "2";
                }

                if (adminLogin) {
                    admin = adminDAO.getUserbyEmail(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error = "1";
                    } else if (!BCrypt.checkpw(pass, admin.getPass())) {
                        error = "2";
                    }
                }
            }

            // If something is wrong
            if (error.length() > 0) {
                response.getWriter().write(error);
            } else {
                // If this is an admin
                if (adminLogin) {
                    session.setAttribute("admin", admin);
                } else {
                    session.setAttribute("patient", patient);
                }
                
                // Save login cookie
                if (remember.equals("yes")) {
                    Cookie loginCookie;
                    if (adminLogin) {
                        loginCookie = new Cookie("a_email", admin.getEmail());
                    } else {
                        loginCookie = new Cookie("u_email", patient.getEmail());
                    }
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 30);
                    response.addCookie(loginCookie);
                }

                response.getWriter().write("success");
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
