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
public class ShowHideController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
        //    String status = req.getParameter("productStatus");
            String productID = req.getParameter("productID");
            ProductDAO productDAO = new ProductDAO();
            Products product = productDAO.getProductByID(Integer.parseInt(productID));
            String status = product.getStatus();
            System.out.println(status);
            if (status.equals("3")) {
                status = "1";
            } else {
                status = "3";
            }

            
            product.setStatus(status);
            productDAO.updateProduct(product);
            System.out.println(product);

            ArrayList<Products> productList = productDAO.getProductList();

            req.setAttribute("productList", productList);
            req.getRequestDispatcher("view/ProductList.jsp").forward(req, resp);

        } catch (SQLException ex) {
            Logger.getLogger(ProductListController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
