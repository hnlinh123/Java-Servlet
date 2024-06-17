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
public class SortController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ArrayList<Products> productList = (ArrayList<Products>)req.getAttribute("productList");
            String valueSort = req.getParameter("sort");
            ProductDAO productDAO = new ProductDAO();
            
            if(valueSort.equals("priceDesc")){
                productDAO.getProductListSort("Price DESC");
            }
            
            if(valueSort.equals("priceDesc")){
                productDAO.getProductListSort("Price DESC");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SortController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    }
    
}
