/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ReviewContentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ReviewContent;

/**
 *
 * @author dell
 */
public class DeleteCommentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String reviewContentID = req.getParameter("reviewCotentID");
            ReviewContentDAO reviewContentDAO = new ReviewContentDAO();
            
            ReviewContent reviewContent = reviewContentDAO.getReviewContentByReviewContentID(reviewContentID);
            String productID = reviewContent.getProductID() ;
            reviewContentDAO.deleteReviewContentByID(Integer.parseInt(reviewContentID));
            
            req.getRequestDispatcher("productDetail?productID="+productID).forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCommentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
