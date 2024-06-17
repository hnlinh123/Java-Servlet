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
import model.Users;

/**
 *
 * @author dell
 */
public class UpdateUserProfileController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String userName = req.getParameter("userName");
            String email = req.getParameter("email");
            String address = req.getParameter("address");
            String password = req.getParameter("password");
            
            HttpSession session = req.getSession();
            Users user = (Users)session.getAttribute("user");
            user.setUserName(userName);
            user.setAddress(address);
            user.setEmail(email);
            user.setPassword(password);
            
            UsersDAO usersDAO = new UsersDAO();
            usersDAO.updateUser(user);
            
            session.setAttribute("user", user);
            String userID = user.getUserID();
            
            req.getRequestDispatcher("view/UserProfile.jsp").forward(req, resp);
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        String userID = user.getUserID();
        req.getRequestDispatcher("view/UserProfile.jsp").forward(req, resp);
    }
    
}
