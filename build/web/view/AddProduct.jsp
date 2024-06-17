<%-- 
    Document   : AddProduct
    Created on : Jul 10, 2023, 10:26:23 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <h1>Add New product</h1>
            <div class="container">
                <form action="addProduct" method="post">
                    <table>
                        <tr>
                            <td>Product Name:</td>
                            <td><input type="text" name="productName"></td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td>
                                <select name="category">
                                    <option value="Food">Food</option>
                                    <option value="Drink">Drink</option>
                                    <option value="Others">Others</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address"></td>
                        </tr>
                        <tr>
                            <td>Product Rate:</td>
                            <td><input type="text" name="product_rate"></td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td><input type="text" name="phoneNumber"></td>
                        </tr>
                        <tr>
                            <td>Image File:</td>
                            <td><input type="text" name="imageFile"></td>
                        </tr>
                        <tr>
                            <td>Price:</td>
                            <td><input type="text" name="price"></td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td><textarea name="description"></textarea></</td>
                        </tr>
                        <tr>
                            <!--                                <td><input type="button" name="reset" value="Reset" onclick="resetForm()"></td>-->
                            <td><input type="submit" name="add" value="Add"></td>
                        </tr>
                    </table>
                </form> 
            </div>

        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
