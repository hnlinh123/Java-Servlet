<%-- 
    Document   : ProductList
    Created on : Jun 5, 2023, 11:00:22 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <!-- Import-->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/bootstrap/css/all.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/bootstrap/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/bootstrap/js/popper.js"></script>
        <link href="${pageContext.request.contextPath}/bootstrap/css/fontawesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        <link href="${pageContext.request.contextPath}/dist/css/style.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/dist/js/index.js"></script>

    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div id="slides" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                    <li data-target="#slides" data-slide-to="0" class="active"></li>
                    <li data-target="#slides" data-slide-to="1"></li>
                    <li data-target="#slides" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/image/page4.jpg" style="height: 400px">
                    <div class="carousel-caption">
                        <h1 class="display-2">Food</h1>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/image/page1.jpg" style="height: 400px">
                    <div class="carousel-caption">
                        <h1 class="display-2">Drinks</h1>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/image/page2.jpg" style="height: 400px">
                    <div class="carousel-caption">
                        <h1 class="display-2">Fruits, diet</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-section">
            <form action="productList" method="post">
                <input class="search-bar" type="text" name="searchPattern" value="${requestScope.searchPattern}" placeholder="Search">
                <input class="button-17"  type="submit" name="searchButton" value="SEARCH">                                  

                <c:if test="${user.getUserRole()=='1'}">
                    <button class="button-17">
                        <a href="addProduct">Add Product</a>
                    </button>
                </c:if>
            </form>
        </div>

        <!--        <form id='sortForm' action="sort" method="post">
                    <input type="hidden" name="productList" value="{productList}">
                    Sort: 
                    <select name="sort" onchange="submitSort()">
                        <option value="none">All</option>
                        <option value="priceDesc">Price: Expensive to Unexpensive</option>
                        <option value="priceAsc">Price: Unexpensive to expensive</option>
                    </select>
                </form>-->

        <div class="container">
            <c:forEach items="${requestScope.productList}" var="product">
                <!--if user = admin -> can hide/show-->
                <c:if test="${user.getUserRole()=='1'}"> 
                    
                    <form id="upHideShowProduct" name="updateStatus" method="post">
                        <input type="hidden" name="productStatus" value="${product.getStatus()}">
                        <input type="hidden" name="productID" value="${product.getProductID()}">
                    </form>
                    <c:if test="${product.getStatus()=='3'}">
                        <div class="row my-3" style="background-color: #abdde5;">
                            <div class="left col-md-6">
                                <img class="headset" src="${pageContext.request.contextPath}/image/${product.getImageFile()}">
                            </div>
                            <div class="right col-md-6">
                                <h3 class="product">${product.getProductName()}</h3>
                                <ul class="desc">
                                    <div class="Stars" style="--rating: ${product.getProductRate()}">
                                    </div>
                                    <li>
                                        Rate: ${product.getProductRate()}
                                    </li>
                                    <li>
                                        Address: ${product.getAddress()}
                                    </li>
                                    <li>
                                        Phone Number: ${product.getPhoneNumber()}
                                    </li>
                                </ul>
                                <p class="price">Price: ${product.getPrice()}d</p>
                                <p>
                                    <button class="button-17">
                                        <a href="productDetail?productID=${product.getProductID()}">
                                            Detail
                                        </a>
                                    </button>
                                </p>
                            </div>
                        </div>
                        <hr style="border: solid gainsboro">
                    </c:if>     
                </c:if>
                <!--if status!=3 -> show-->
                <c:if test="${product.getStatus()!='3'}">
                    <div class="row my-3" style="background-color: #ffffff;">
                        <div class="left col-md-6">
                            <img class="headset" src="${pageContext.request.contextPath}/image/${product.getImageFile()}">
                        </div>
                        <div class="right col-md-6">
                            <h3 class="product">${product.getProductName()}</h3>
                            <ul class="desc">
                                <div class="Stars" style="--rating: ${product.getProductRate()}">
                                </div>
                                <li>
                                    Rate: ${product.getProductRate()}
                                </li>
                                <li>
                                    Address: ${product.getAddress()}
                                </li>
                                <li>
                                    Phone Number: ${product.getPhoneNumber()}
                                </li>
                            </ul>
                            <p class="price">Price: ${product.getPrice()}d</p>
                            <p>
                                <button class="button-17">
                                    <a href="productDetail?productID=${product.getProductID()}">
                                        Detail
                                    </a>
                                </button>
                            </p>
                        </div>
                    </div>
                    <hr style="border: solid gainsboro">
                </c:if> 

            </c:forEach>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <script>
            function submitSort() {
            document.getElementById('sortForm').submit();
            do
            }

            function ShowProduct(var productID) {

            var showProduct = document.getElementById("hideProduct-" + productID);
            document.getElementById("hideOrShowProduct-" + productID).innerHTML = "<button id='' class='button-17' onClick='HideProduct()'>Show</button>";
            document.getElementById("upHideShowProduct").submit();
            }

            function HideProduct(var productID) {

            var showProduct = document.getElementById("hideProduct-" + productID);
            document.getElementById("hideOrShowProduct-" + productID).innerHTML = "<button id='' class='button-17' onClick='ShowProduct()'>Show</button>";
            document.getElementById("upHideShowProduct").submit();
            }
        </script>
    </body>
</html>
