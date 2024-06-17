<%-- 
    Document   : productDetail
    Created on : Jun 26, 2023, 12:10:51 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.getProductName()}</title>
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
        <c:set value="${requestScope.product}" var="product"></c:set>
        <c:set value="${requestScope.reviewContentList}" var="reviewContentList"></c:set>
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
        <div class="container">
            <div class="row my-3">
                <div class="left col-md-6">
                    <img class="headset" src="${pageContext.request.contextPath}/image/${product.getImageFile()}">
                </div>
                <div class="right col-md-6">
                    <h3 class="product">${product.getProductName()}</h3>
                    <ul class="desc" >
                        <div class="Stars" style="--rating: ${product.getProductRate()}">
                        </div>
                        <li style="font-size: 20px">
                            Rate: ${product.getProductRate()}
                        </li>
                        <li style="font-size: 20px">
                            Address: ${product.getAddress()}
                        </li>
                        <li style="font-size: 20px" >
                            Phone Number: ${product.getPhoneNumber()}
                        </li>
                        <li style="font-size: 20px">
                            <p class="price">Price: ${product.getPrice()}</p>
                        </li>
                        <p style="font-size: 20px">
                            ${product.getDescription()}
                        </p>
                    </ul>
                </div>
            </div>
            <c:if test="${user.getUserRole()=='1'}">
                <div class="col-12">
                    <input type="hidden" name="productStatus" value="${product.getStatus()}">
                    <button class="button-17">
                        <a href="updateProduct?productID=${product.getProductID()}">Update Product</a>
                    </button>
                        <c:if test="${product.getStatus()=='3'}">
                            <button class="button-17"><a href="updateStatus?productID=${product.getProductID()}">Show</a></button>
                        </c:if>
                        <c:if test="${product.getStatus()!='3'}">
                            <button class="button-17"><a href="updateStatus?productID=${product.getProductID()}">Hide</a></button>
                        </c:if>
                    
                </div>           
            </c:if>
        </div>
        <hr>

        <div class="container-fluid padding">
            <c:if test="${user!=null}">
                <c:if test="${haveComment==null}">
                    <h4>Leave your comment for us to know more:</h4>
                    <form action="reviewComment" method="post">
                        <input type="hidden" name="productID" value="${product.getProductID()}">
                        <div class="row">
                            <div class="col-25">
                                Rate:
                            </div>
                            <div class="col-75">
                                <select name="user_rate">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-25">
                                Comment:
                            </div>
                            <div class="col-75">
                                <textarea name="comment" rows="5" cols="10"></textarea>
                            </div>
                        </div>
                        <br>
                        <input type="submit" class="button-17" name="OK" value="Submit">
                    </form>
                </c:if>
            </c:if>
            <c:if test="${user==null}">
                <p>
                    <button class="button-17">
                        <a href="login">
                            Login to comment!
                        </a>
                    </button>
                </p>
            </c:if>
        </div>
        <hr>

        <div class="container-fluid padding">
            <div class="row padding">
                <div class="col-12">

                    <div>
                        Average Rate by Others: <div class="Stars" style="--rating:${aRate}">
                        </div>
                    </div>
                    <hr>
                    <div class="col-12">
                        <h1 class="display-4" style="font-size: 30px">COMMENT </h1>
                    </div>
                    <c:if test="${requestScope.reviewContentList!=null}">
                        <c:forEach items="${reviewContentList}" var="reviewContent"> 
                            <div class="container">
                                <div class="row my-3">
                                    <div class="left col-md-6">
                                        <img src="${pageContext.request.contextPath}/image/defaultAvatar.jpg" alt="alt" style="width: 40px"/>
                                        From User: ${reviewContent.getUserName()}
                                        <br>
                                        <c:if test="${user!=null}">
                                            <c:if test="${reviewContent.getUserID().equals(user.getUserID())}">
                                                <button class="button-17" onclick="editComment(${reviewContent.getReviewContentID()})">
                                                    Edit
                                                </button>
                                                <button class="button-17">
                                                    <a href="deleteComment?reviewCotentID=${reviewContent.getReviewContentID()}">
                                                        Delete
                                                    </a>
                                                </button>
                                            </c:if>
                                        </c:if>
                                    </div>
                                    <div class="right col-md-6">
                                        <form id="f2" action="editComment" method="post">
                                            <input type="hidden" name="reviewContentID" value="${reviewContent.getReviewContentID()}">
                                            <input type="hidden" name="productID" value="${product.getProductID()}">
                                            Rate: <div class="Stars" style="--rating: ${reviewContent.getUser_rating()}">
                                            </div>
                                            <ul class="desc" >
                                                <div id="reviewComment-${reviewContent.getReviewContentID()}" style="font-size: 16px">
                                                    ${reviewContent.getComment()}
                                                </div>
                                            </ul>
                                        </form>                                       
                                    </div>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>

                    </c:if>
                    <c:if test="${requestScope.reviewContentList==null}">
                        <h2>Be the first feed back review one!</h2>
                    </c:if>
                </div> 
            </div>
        </div>    
        <jsp:include page="Footer.jsp"></jsp:include>

        <script>
            function editComment(reviewContentID) {
                var reviewCommentElement = document.getElementById("reviewComment-" + reviewContentID);
                var commentText = reviewCommentElement.innerHTML.trim();
                reviewCommentElement.innerHTML = "<input class='search-bar' style='width:200px;' type='text' name='userComment' value='" + commentText + "'> <br> <input class='button-17' type='submit' name='editRV' value='Submit'>";
            }
        </script>
    </body>
</html>
