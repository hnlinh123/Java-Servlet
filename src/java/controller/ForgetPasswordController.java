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
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class ForgetPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UsersDAO userDAO = new UsersDAO();
            String email = req.getParameter("email");
            String dob = req.getParameter("dob");
            
            if (email == null || dob == null) {
                req.setAttribute("message", "Please fill required fill!");
            } else {
                switch (userDAO.checkUserForgetPassword(email, dob)) {
                    case 1:
                        req.setAttribute("message", "Please check your email to receive new Password!");
                        req.getRequestDispatcher("view/Login.jsp").forward(req, resp);
                        break;
                    case 2:
                        req.setAttribute("message", "Please check again your email or date of birth input!");
                        req.getRequestDispatcher("view/ForgetPassword.jsp").forward(req, resp);
                        break;
                    case 0:
                        req.setAttribute("message", "Cannot find your email account!");
                        req.getRequestDispatcher("view/ForgetPassword.jsp").forward(req, resp);
                        break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ForgetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/ForgetPassword.jsp").forward(req, resp);
    }

}
