/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Products;

/**
 *
 * @author dell
 */
public class ProductDAO extends DBContext {

    private ArrayList<Products> productsList;
    Connection con;
    String status;

    public ProductDAO() throws SQLException {
        con = new DBContext().getConnection();
    }

    public ArrayList<Products> getProductList() {
        productsList = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productID = String.valueOf(rs.getInt(1));
                String productName = String.valueOf(rs.getString(2));
                String category = String.valueOf(rs.getString(3));
                String description = String.valueOf(rs.getString(4));
                String productRate = String.valueOf(rs.getDouble(5));
                String address = String.valueOf(rs.getString(6));
                String phoneNumber = String.valueOf(rs.getString(7));
                String imageFile = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String price = String.valueOf(rs.getDouble(10));
                Products product = new Products(productID, productName, category, description, productRate, address, phoneNumber, imageFile, status, price);

                productsList.add(product);
            }
        } catch (Exception e) {
            status = "getProductList: " + e.getMessage();
            System.out.println(status);
        }
        return productsList;
    }

    public ArrayList<Products> getProductListSort(String field) {
        productsList = new ArrayList<>();
        String sql = "select * from Products ORDER BY " + field;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productID = String.valueOf(rs.getInt(1));
                String productName = String.valueOf(rs.getString(2));
                String category = String.valueOf(rs.getString(3));
                String description = String.valueOf(rs.getString(4));
                String productRate = String.valueOf(rs.getDouble(5));
                String address = String.valueOf(rs.getString(6));
                String phoneNumber = String.valueOf(rs.getString(7));
                String imageFile = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String price = String.valueOf(rs.getDouble(10));
                Products product = new Products(productID, productName, category, description, productRate, address, phoneNumber, imageFile, status, price);

                productsList.add(product);
            }
        } catch (Exception e) {
            status = "getProductListSort: " + e.getMessage();
            System.out.println(status);
        }
        return productsList;
    }

    public int insertProduct(Products product) throws SQLException {
        String sql = "insert into [Products] (productName, category, "
                + "description, productRate, address,"
                + "phoneNumber, imageFile, status, price)"
                + " values (?,?,?,?,?,?,?,?, ?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getCategory());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, Double.parseDouble(product.getProductRate()));
            ps.setString(5, product.getAddress());
            ps.setString(6, product.getPhoneNumber());
            ps.setString(7, product.getImageFile());
            ps.setString(8, product.getStatus());
            ps.setDouble(9, Double.parseDouble(product.getPrice()));

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertProduct: " + e.getMessage());
        }
        return 0;
    }

    public int updateProduct(Products product) throws SQLException {
        String sql = "update [Products] set "
                + "productName=?,  category=?, description=?,"
                + "productRate=?, address=?, phoneNumber=?,"
                + "imageFile=?, status=?, price=? "
                + "where productID=? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            //    ResultSet rs = ps.executeQuery();
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getCategory());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, Double.parseDouble(product.getProductRate()));
            ps.setString(5, product.getAddress());
            ps.setString(6, product.getPhoneNumber());
            ps.setString(7, product.getImageFile());
            ps.setString(8, product.getStatus());
            ps.setDouble(9, Double.parseDouble(product.getPrice()));
            ps.setInt(10, Integer.parseInt(product.getProductID()));

            return ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at update Product:" + e.getMessage();
            System.out.println(status);
        }
        return 0;
    }

    public Products getProductByID(int id) {
        String sql = "select * from Products where productID=" + id;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productID = String.valueOf(rs.getInt(1));
                String productName = String.valueOf(rs.getString(2));
                String category = String.valueOf(rs.getString(3));
                String description = String.valueOf(rs.getString(4));
                String productRate = String.valueOf(rs.getDouble(5));
                String address = String.valueOf(rs.getString(6));
                String phoneNumber = String.valueOf(rs.getString(7));
                String imageFile = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String price = String.valueOf(rs.getDouble(10));
                Products product = new Products(productID, productName, category, description, productRate, address, phoneNumber, imageFile, status, price);

                return product;
            }
        } catch (Exception e) {
            status = "getProduct: " + e.getMessage();
            System.out.println(status);
        }
        return null;
    }

    public ArrayList<Products> getProductListByPattern(String pattern) {
        productsList = new ArrayList<>();
        String sql = "select * from Products WHERE productName like ? OR category like ? "
                + "OR address like ? OR phoneNumber like ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            // Bind the pattern to each respective parameter
            ps.setString(1, "%" + pattern + "%");
            ps.setString(2, "%" + pattern + "%");
            ps.setString(3, "%" + pattern + "%");
            ps.setString(4, "%" + pattern + "%");
            // Assuming 'price' is a string column, use setString
        //    ps.setDouble(5, Double.parseDouble(pattern));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productID = String.valueOf(rs.getInt(1));
                String productName = String.valueOf(rs.getString(2));
                String category = String.valueOf(rs.getString(3));
                String description = String.valueOf(rs.getString(4));
                String productRate = String.valueOf(rs.getDouble(5));
                String address = String.valueOf(rs.getString(6));
                String phoneNumber = String.valueOf(rs.getString(7));
                String imageFile = String.valueOf(rs.getString(8));
                String status = String.valueOf(rs.getString(9));
                String price = String.valueOf(rs.getDouble(10));
                Products product = new Products(productID, productName, category, description, productRate, address, phoneNumber, imageFile, status, price);

                productsList.add(product);
            }
        } catch (Exception e) {
            status = "getProductListByPattern: " + e.getMessage();
            System.out.println(status);
        }
        System.out.println(productsList);
        return productsList;
    }

    public ArrayList<Products> getProductListByCategory(String category) {
        ArrayList<Products> productList = getProductList();
        for (Products product : productList) {
            if (product.getCategory().contains(category)) {
                productList.add(product);
            }
        }
        return productList;
    }

}
