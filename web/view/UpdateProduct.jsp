<%-- 
    Document   : UpdateProduct
    Created on : Jul 10, 2023, 10:27:04 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update ${product.getProductName()}</title>
        <!-- Import-->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/bootstrap/css/all.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/bootstrap/js/popper.js"></script>
        <link href="${pageContext.request.contextPath}/bootstrap/css/fontawesome.min.css" rel="stylesheet">


        <link href="${pageContext.request.contextPath}/dist/css/style.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/dist/js/index.js"></script>

    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:set value="${product}" var="product"></c:set>
            <form action="updateProduct" method="post">
                <input type="hidden" name="productID" value="${product.getProductID()}">
            <div class="container-fluid padding" style="padding: 20px;">
                <div class="row padding">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-25">
                                Product Name:
                            </div>
                            <div class="col-75">
                                <input type="text" class="comment-style" name="productName" value="${product.getProductName()}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                Product Rate:
                            </div>
                            <div class="col-75">
                                <input type="text" name="productRate" value="${product.getProductRate()}">
                            </div>
                        </div>
                        </tr>
                        <div class="row">
                            <div class="col-25">Category
                            </div>
                            <div class="col-75">
                                <input type="radio" name="category" value="Food" <%= ("Food".equals(request.getAttribute("category")) ? "checked" : "") %>>Food
                                <input type="radio" name="category" value="Drink" <%= ("Drink".equals(request.getAttribute("category")) ? "checked" : "") %>>Drink
                                <input type="radio" name="category" value="Others" <%= ("Others".equals(request.getAttribute("category")) ? "checked" : "") %>>Others
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">Address:</div>
                            <div class="col-75"><input class="comment-style" type="text" name="address" value="${product.getAddress()}"></td>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">Phone Number:</div>
                            <div class="col-75"><input class="comment-style" type="text" name="phoneNumber"value="${product.getPhoneNumber()}"></td>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">Image File:</div>
                            <div class="col-75"><input class="comment-style" type="text" name="imageFile"value="${product.getImageFile()}"></td>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">Price:</div>
                            <div class="col-75"><input class="comment-style" type="text" name="price" value="${product.getPrice()}"></td>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">Description:</div>
                            <div class="col-75">
                                <textarea name="description" style="width: 500px; height: 600px;">${product.getDescription()}
                                </textarea>
                            </div>
                        </div>
                        <td><input class="button-17" type="submit" name="update" value="Update"></td>
                    </div>
                </div>
            </div>
        </form>        
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
