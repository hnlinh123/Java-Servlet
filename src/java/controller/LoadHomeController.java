/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;

/**
 *
 * @author dell
 */
public class LoadHomeController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Products> productList = productDAO.getProductList();
            
            HttpSession session = req.getSession();
            session.setAttribute("productList", productList);
            req.getRequestDispatcher("view/Home.jsp").forward(req, resp);
            
        } catch (SQLException ex) {
            Logger.getLogger(LoadHomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
