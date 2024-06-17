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
import model.Users;

/**
 *
 * @author dell
 */
public class VerifyController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the email and verify code from the form
            String email = req.getParameter("email");
            String verifyCode = req.getParameter("verifyCode");
            
            // Check if the verify code is correct
            UsersDAO userDAO = new UsersDAO();
            Users user = userDAO.getUserByEmail(email);
            boolean isCodeCorrect=false;
            if(user.getVerifyCode().equals(verifyCode)){
                isCodeCorrect = true;
            }
            
            if (isCodeCorrect) {
                // Update the user's status to "active"
                user.setStatus("1");
                userDAO.updateUser(user);
                
                // Forward to the success screen
                req.getRequestDispatcher("Home.jsp").forward(req, resp);
            } else {
                // Display error message and forward back to the same screen
                req.setAttribute("message", "The verify code is incorrect. Please try again.");
                req.getRequestDispatcher("Verify.jsp").forward(req, resp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VerifyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
