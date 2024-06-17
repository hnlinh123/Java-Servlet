/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class ReviewContent {
    String reviewContentID, userID, productID, user_rating, comment, status, userName;

    public ReviewContent() {
    } 

    public ReviewContent(String reviewContentID, String userID, String productID, String user_rating, String comment, String status, String userName) {
        this.reviewContentID = reviewContentID;
        this.userID = userID;
        this.productID = productID;
        this.user_rating = user_rating;
        this.comment = comment;
        this.status = status;
        this.userName = userName;
    }
    
    
    public ReviewContent(String userID, String productID, String user_rating, String comment, String status) {
        this.userID = userID;
        this.productID = productID;
        this.user_rating = user_rating;
        this.comment = comment;
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    
    
    public String getReviewContentID() {
        return reviewContentID;
    }

    public void setReviewContentID(String reviewContentID) {
        this.reviewContentID = reviewContentID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getUser_rating() {
        return user_rating;
    }

    public void setUser_rating(String user_rating) {
        this.user_rating = user_rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ReviewContent{" + "reviewContentID=" + reviewContentID + ", userID=" + userID + ", productID=" + productID + ", user_rating=" + user_rating + ", comment=" + comment + ", status=" + status + ", userName=" + userName + '}';
    }
    
    
    
    
}
