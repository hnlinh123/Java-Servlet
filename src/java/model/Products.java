/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.ReviewContentDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class Products {
    
    String productID, productName, category, description, productRate, address, phoneNumber, imageFile, status, price;

    public Products(String productID, String productName, String category, String description, String productRate, String address, String phoneNumber, String imageFile, String status, String price) {
        this.productID = productID;
        this.productName = productName;
        this.category = category;
        this.description = description;
        this.productRate = productRate;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.imageFile = imageFile;
        this.status = status;
        this.price = price;
    }

    public Products(String productName, String category, String description, String productRate, String address, String phoneNumber, String imageFile, String status, String price) {
        this.productName = productName;
        this.category = category;
        this.description = description;
        this.productRate = productRate;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.imageFile = imageFile;
        this.status = status;
        this.price = price;
    }

    
    
    
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductRate() {
        return productRate;
    }

    public void setProductRate() {
        try {
            ReviewContentDAO reviewContentDAO = new ReviewContentDAO();
            this.productRate = String.valueOf(reviewContentDAO.getAverageRateOfProduct(productID));
        } catch (SQLException ex) {
            Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("setProductRate: "+ex.getMessage());
        }
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getImageFile() {
        return imageFile;
    }

    public void setImageFile(String imageFile) {
        this.imageFile = imageFile;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", productName=" + productName + ", category=" + category + ", description=" + description + ", productRate=" + productRate + ", address=" + address + ", phoneNumber=" + phoneNumber + ", imageFile=" + imageFile + ", status=" + status + ", price=" + price + '}';
    }
    
    
    
}
