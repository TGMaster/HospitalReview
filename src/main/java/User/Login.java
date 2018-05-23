/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import User.DAO.*;
import User.DTO.*;

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
        String error = "";
        boolean adminLogin = false;
        Admin admin = new Admin();
        Patient patient = new Patient();

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else if (action.equals("Ajax Login")) {
            
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email.equals("") || pass.equals("")) {
                error += "Please type email and password.";
            } else {
                patient = patientDAO.login(email);

                if (patient.getPass() == null) {
                    error += "User does not exist";
                    adminLogin = true;
                } else if (!PasswordHashing.checkPassword(pass, patient.getPass())) {
                    error += "Please enter valid username or password";
                    adminLogin = true;
                }

                if (adminLogin) {
                    admin = adminDAO.login(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error += "User does not exist";
                    } else if (!PasswordHashing.checkPassword(pass, admin.getPass())) {
                        error += "Please enter valid username or password";
                    }
                }
            }

            // If something is wrong
            if (error.length() > 0) {
                response.getWriter().write(error);
            } else {
                // If this is an admin
                if (adminLogin) {
                    session.setAttribute("user", admin);
                } else {
                    session.setAttribute("user", patient);
                }

                // Save login cookie
                if (remember != null) {
                    Cookie loginCookie;
                    if (adminLogin) {
                        loginCookie = new Cookie("u_email", admin.getEmail());
                    } else {
                        loginCookie = new Cookie("u_email", patient.getEmail());
                    }
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);
                }

                response.sendRedirect("/home.jsp");
            }

        } else {

            // Get input from jsp
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email.equals("") || pass.equals("")) {
                error += "Please enter all username and password";
            } else {
                patient = patientDAO.login(email);

                // Check if user does not exist
                if (patient.getPass() == null) {
                    error += "User does not exist";
                    adminLogin = true;  // In case user is not patient

                    // If exist then check password
                } else if (!PasswordHashing.checkPassword(pass, patient.getPass())) {
                    error += "Please enter valid username or password";
                    adminLogin = true;  // In case user is not patient
                }

                if (adminLogin) {
                    admin = adminDAO.login(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error += "User does not exist";
                    } else if (!PasswordHashing.checkPassword(pass, admin.getPass())) {
                        error += "Please enter valid username or password";
                    }
                }
            }

            // If something is wrong
            if (error.length() > 0) {
                request.setAttribute("error", error);

                rd = sc.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {

                // If this is an admin
                if (adminLogin) {
                    session.setAttribute("user", admin);
                } else {
                    session.setAttribute("user", patient);
                }

                // Save login cookie
                if (remember != null) {
                    Cookie loginCookie;
                    if (adminLogin) {
                        loginCookie = new Cookie("u_email", admin.getEmail());
                    } else {
                        loginCookie = new Cookie("u_email", patient.getEmail());
                    }
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);
                }

                response.sendRedirect("/home.jsp");
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
