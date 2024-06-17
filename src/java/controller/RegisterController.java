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
import utils.Utility;

/**
 *
 * @author dell
 */
public class RegisterController extends HttpServlet {

//    UserDAO userDAO = new UserDAO();
    Utility ultility = new Utility();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UsersDAO userDAO = new UsersDAO();
            String userName = req.getParameter("userName");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            String address = req.getParameter("address");
            String verifyCode = ultility.createCaptcha();
            String status = "1"; //2
            String userRole = "2"; //normal user
            
            if (userName == null || email == null || password == null || dob == null
                    || gender == null || address == null) {
                req.setAttribute("message", "Please fill the information!");
                req.getRequestDispatcher("view/Register.jsp").forward(req, resp);
            } else {
                Users user = new Users(userName, email, password, dob, gender, address, verifyCode, status, userRole);
                userDAO.insertUser(user);
//                req.setAttribute("message", "Please check you email to verify account!");
//                req.getRequestDispatcher("Verify.jsp").forward(req, resp);
                req.getRequestDispatcher("view/Login.jsp").forward(req, resp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
