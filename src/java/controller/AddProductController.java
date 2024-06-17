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
public class AddProductController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String productName = req.getParameter("productName");
            String category = req.getParameter("category");
            String description = req.getParameter("description");
            String address = req.getParameter("address");
            String phoneNumber = req.getParameter("phoneNumber");
            String imageFile = req.getParameter("imageFile");
            String price = req.getParameter("price");
            String productRate = req.getParameter("product_rate");
            
            ProductDAO productDAO = new ProductDAO();
            Products product = new Products(productName, category, description, productRate, address, phoneNumber, imageFile, "1", price);
        
            productDAO.insertProduct(product);
            
            ArrayList<Products> productList = productDAO.getProductList();

            req.setAttribute("productList", productList);
            req.getRequestDispatcher("view/ProductList.jsp").forward(req, resp);

           
        } catch (SQLException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/AddProduct.jsp").forward(req, resp);
    }
    
}
