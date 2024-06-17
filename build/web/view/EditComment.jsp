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
        </div>
        <hr>
        <h4>Leave your comment for us to know more:</h4>
        <div class="container-fluid padding">
            <c:if test="${user!=null}">
                <form action="reviewComment" method="post">
                    <table>
                        <tr>
                            <td>Rate:</td>
                            <td>
                                <input type="radio" name="user_rate" value="1">
                                <div class="Stars" style="--rating:1">
                                </div><br>

                                <input type="radio" name="user_rate" value="2">
                                <div class="Stars" style="--rating: 2">
                                </div><br>

                                <input type="radio" name="user_rate" value="3">
                                <div class="Stars" style="--rating: 3">
                                </div><br>

                                <input type="radio" name="user_rate" value="4">
                                <div class="Stars" style="--rating: 4">
                                </div><br>

                                <input type="radio" name="user_rate" value="5">
                                <div class="Stars" style="--rating: 5">
                                </div><br>
                                <br>
                            </td>
                        </tr>
                        <tr>

                            <td>Comment:</td>
                            <td><input class="comment-style" type="textarea" name="comment""><br></td>

                        </tr>
                        <tr>
                            <th colspan="2" style="text-align: center;">
                                <br>
                                <input type="submit" class="button-17" name="submit" value="Submit">
                            </th>
                        </tr>
                    </table>
                </form>
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
                    <h2>USER COMMENT: </h2>                
                    <div class="container">
                        <c:forEach items="${reviewContentList}" var="reviewContent"> 
                            <div class="row my-3">
                                <div class="left col-md-6">
                                    From User: ${reviewContent.getUserName()}
                                </div>
                                <div class="right col-md-6">
                                    <c:if test="${!editComment}">
                                        Rate: <div class="Stars" style="--rating: ${reviewContent.getUser_rating()}">
                                        </div>
                                    </c:if>
                                    <c:if test="${editComment}">
                                        Rate: <br>
                                        <input type="radio" name="user_rate" value="1">
                                        <div class="Stars" style="--rating:1">
                                        </div><br>

                                        <input type="radio" name="user_rate" value="2">
                                        <div class="Stars" style="--rating: 2">
                                        </div><br>

                                        <input type="radio" name="user_rate" value="3">
                                        <div class="Stars" style="--rating: 3">
                                        </div><br>

                                        <input type="radio" name="user_rate" value="4">
                                        <div class="Stars" style="--rating: 4">
                                        </div><br>

                                        <input type="radio" name="user_rate" value="5">
                                        <div class="Stars" style="--rating: 5">
                                        </div><br>
                                        <br>
                                    </c:if>    

                                    <c:if test="${user!=null}">
                                        <c:if test="${reviewContent.getUserID()==user.getID()}">
                                            <ul class="desc" >
                                                <input style="font-size: 16px" type="text" name="comment" value="${reviewContent.getComment}">
                                            </ul>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                            <c:if test="${user!=null}">
                                <c:if test="${reviewContent.getUserID()==user.getID()}">
                                    <button class="button-17">
                                        <a href="editComment">
                                            Edit
                                        </a>
                                    </button>
                                </c:if>
                            </c:if>
                            <hr>
                        </c:forEach>
                    </div>
                </div> 
            </div>
        </div>    
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
