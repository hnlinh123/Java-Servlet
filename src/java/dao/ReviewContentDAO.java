/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Products;
import model.ReviewContent;

/**
 *
 * @author dell
 */
public class ReviewContentDAO extends DBContext {

    private ArrayList<ReviewContent> reviewContentList;
    Connection con;
    String status;
    ProductDAO productDAO = new ProductDAO();

    public ReviewContentDAO() throws SQLException {
        con = new DBContext().getConnection();
    }

    public ArrayList<ReviewContent> getReviewContentListByProductID(String productID) {
        ArrayList<ReviewContent> reviewContentList = new ArrayList<>();
        try {
            //    Product product = productDAO.getProductByID(Integer.parseInt(productID));
            String sql = "select a.*, b.userName from ReviewContent a join Users b on a.userID = b.userID where productID=" + productID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String reviewContentID = String.valueOf(rs.getInt(1));
                String userID = String.valueOf(rs.getInt(2));
                String retrievedProductID = String.valueOf(rs.getInt(3));
                String user_rating = String.valueOf(rs.getInt(4));
                String user_comment = String.valueOf(rs.getString(5));
                String status = String.valueOf(rs.getString(6));
                String userName = String.valueOf(rs.getString(7));

                ReviewContent reviewContent = new ReviewContent(reviewContentID, userID, retrievedProductID, user_rating, user_comment, status, userName);
                reviewContentList.add(reviewContent);
            }

        } catch (SQLException ex) {
            System.out.println("Error ReviewDAO: " + ex.getMessage());
            Logger.getLogger(ReviewContentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reviewContentList;
    }
    public ReviewContent getReviewContentByReviewContentID(String reviewContentID) {
        try {
            String sql = "select a.*, b.userName from ReviewContent a join Users b on a.userID = b.userID where reviewContentID=" + reviewContentID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String reviewContentID1 = String.valueOf(rs.getInt(1));
                String userID = String.valueOf(rs.getInt(2));
                String retrievedProductID = String.valueOf(rs.getInt(3));
                String user_rating = String.valueOf(rs.getInt(4));
                String user_comment = String.valueOf(rs.getString(5));
                String status = String.valueOf(rs.getString(6));
                String userName = String.valueOf(rs.getString(7));

                ReviewContent reviewContent = new ReviewContent(reviewContentID1, userID, retrievedProductID, user_rating, user_comment, status, userName);
                
                return reviewContent;
            }

        } catch (SQLException ex) {
            System.out.println("Error ReviewDAO: " + ex.getMessage());
            Logger.getLogger(ReviewContentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getAverageRateOfProduct(String productID) {
        try {
            ArrayList<ReviewContent> reviewContentList = getReviewContentListByProductID(productID);
            double averageRate = 0;
            double totalRate = 0, countReview = 0;

            for (ReviewContent reviewContent : reviewContentList) {
                totalRate = totalRate + Double.parseDouble(reviewContent.getUser_rating());
                countReview++;
            }
            if (countReview > 0) {
                averageRate = totalRate / countReview;
            }

            return averageRate;

        } catch (Exception e) {
            System.out.println("Error at reloadRateOrder: " + e.getMessage());
        }
        return 5;
    }

    public int insertReviewContent(ReviewContent reviewContent) {
        String sql = "insert into [ReviewContent] (userID, productID,"
                + "comment, user_rating, status)"
                + " values (?,?,?,?,?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reviewContent.getUserID());
            ps.setString(2, reviewContent.getProductID());
            ps.setString(3, reviewContent.getComment());
            ps.setString(4, reviewContent.getUser_rating());
            ps.setString(5, reviewContent.getStatus());

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at insertReviewContent:" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }

    public boolean checkReviewContentOfUser(String userID, String productID) {
        ArrayList<ReviewContent> reviewContentList = new ArrayList<>();
        try {
            //    Product product = productDAO.getProductByID(Integer.parseInt(productID));
            String sql = "select a.*, b.userName from ReviewContent a join Users b ON a.userID = b.userID WHERE a.productID=" + productID + " AND a.userID=" + userID;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String reviewContentID = String.valueOf(rs.getInt(1));
                String userID2 = String.valueOf(rs.getInt(2));
                String retrievedProductID = String.valueOf(rs.getInt(3));
                String user_rating = String.valueOf(rs.getInt(4));
                String user_comment = String.valueOf(rs.getString(5));
                String status = String.valueOf(rs.getString(6));
                String userName = String.valueOf(rs.getString(7));

                ReviewContent reviewContent = new ReviewContent(reviewContentID, userID2, retrievedProductID, user_rating, user_comment, status, userName);
                reviewContentList.add(reviewContent);

            }

        } catch (SQLException ex) {
            System.out.println("Error ReviewDAO: " + ex.getMessage());
            Logger.getLogger(ReviewContentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (reviewContentList.isEmpty() || reviewContentList.size() == 0) {
            return false; //k có
        } else {
            return true; //có
        }
    }

    public int deleteReviewContentByID(int id) {
        String sql = "DELETE FROM [ReviewContent] where ReviewContentID=? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at deleteReviewContent:" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }
    
    public int updateReviewContent(ReviewContent reviewContent) {
        String sql = "UPDATE [ReviewContent]  SET "
                + "comment=? "
                + "WHERE reviewContentID=? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reviewContent.getComment());
            ps.setString(2, reviewContent.getReviewContentID());

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at updateReviewContent:" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }

}
