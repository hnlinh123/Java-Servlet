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
public class ProductListController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String searchPattern = req.getParameter("searchPattern");
            ProductDAO productDAO = new ProductDAO();
            if (searchPattern == null) {
                req.getRequestDispatcher("view/ProductList.jsp").forward(req, resp);
            } else {
                ArrayList<Products> productSearchList = productDAO.getProductListByPattern(searchPattern);
                req.setAttribute("productList", productSearchList);
            }
            req.getRequestDispatcher("view/ProductList.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(req.getParameter("searchPattern")!=null){
                doPost(req, resp);
            }
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Products> productList = productDAO.getProductList();

            req.setAttribute("productList", productList);
            req.getRequestDispatcher("view/ProductList.jsp").forward(req, resp);

        } catch (SQLException ex) {
            Logger.getLogger(ProductListController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
