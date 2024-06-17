/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.Cookie;

import model.Users;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UsersDAO userDAO = new UsersDAO();
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if (email == null || password == null) {
                req.setAttribute("message", "Please fill required field!");
                req.getRequestDispatcher("view/Login.jsp").forward(req, resp);
            } else {
                switch (userDAO.checkUserLogin(email, password)) {
                    case 0:
                        req.setAttribute("message", "Wrong email or password!");
                        break;
                    case 1:
                        req.setAttribute("message", "Welcome back!");
                        Users user = userDAO.getUserByEmail(email);
                        HttpSession session = req.getSession();
                        session.setAttribute("user", user);

                        //Cookie part
                        if (req.getParameter("rememberMe") != null) {
                            // Create a new cookie for email
                            Cookie emailCookie = new Cookie("email", email);
                            emailCookie.setMaxAge(30 * 24 * 60 * 60); // Set the cookie expiry time (30 days)
                            emailCookie.setPath("/");

                            // Create a new cookie for password (Note: Storing password in a cookie is not recommended for security reasons)
                            Cookie passwordCookie = new Cookie("password", password);
                            passwordCookie.setMaxAge(30 * 24 * 60 * 60); // Set the cookie expiry time (30 days)
                            passwordCookie.setPath("/");

                            // Add the cookies to the response
                            resp.addCookie(emailCookie);
                            resp.addCookie(passwordCookie);
                        }
                        
                        req.getRequestDispatcher("view/Home.jsp").forward(req, resp);

                        break;
                    case 4:
                        req.setAttribute("message", "Email or password is wrong!");
                        break;
                    case 3:
                        req.setAttribute("message", "Account has been deactive!");
                        break;
                    case 2:
                        req.setAttribute("message", "Account need to verified!");
                        break;
                    default:
                        throw new AssertionError();
                }
                req.getRequestDispatcher("view/Login.jsp").forward(req, resp);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("rememberMe") != null) {
            // Get the cookies from the request
            Cookie[] cookies = req.getCookies();

            // Check if the cookies exist and extract the values
            if (cookies != null) {
                String email = null;
                String password = null;

                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("email")) {
                        email = cookie.getValue();
                    } else if (cookie.getName().equals("password")) {
                        password = cookie.getValue();
                    }
                }

                // Set the values in request attributes to pre-fill the login form
                req.setAttribute("email", email);
                req.setAttribute("password", password);
            }
        }
        req.getRequestDispatcher("view/Login.jsp").forward(req, resp);
    }
    
}
