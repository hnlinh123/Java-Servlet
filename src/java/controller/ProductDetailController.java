/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ProductDAO;
import dao.ReviewContentDAO;
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
import model.ReviewContent;
import model.Users;

/**
 *
 * @author dell
 */
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String productID = req.getParameter("productID");
            ProductDAO productDAO = new ProductDAO();
            Products product = productDAO.getProductByID(Integer.parseInt(productID));

            req.setAttribute("product", product);

            ReviewContentDAO reviewContentDAO = new ReviewContentDAO();
            ArrayList<ReviewContent> reviewContentList = reviewContentDAO.getReviewContentListByProductID(productID);

            req.setAttribute("reviewContentList", reviewContentList);

            if (session.getAttribute("user") != null) {
                Users user = (Users) session.getAttribute("user");
                if (reviewContentDAO.checkReviewContentOfUser(user.getUserID(), productID)) {
                    System.out.println("check comment of account: "+reviewContentDAO.checkReviewContentOfUser(user.getUserID(), productID));
                    req.setAttribute("haveComment", "1");
                } else {
                    System.out.println("null Comment");
                    req.setAttribute("haveComment", null);
                }
            }
            
            double userAverageRate = reviewContentDAO.getAverageRateOfProduct(productID);
            
            req.setAttribute("aRate", userAverageRate);
            req.getRequestDispatcher("view/ProductDetail.jsp").forward(req, resp);

        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
