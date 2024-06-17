<%-- 
    Document   : Menu
    Created on : May 11, 2023, 11:53:47 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

    <c:set value="${sessionScope.user}" var="user"></c:set>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-md bg-light sticky-top" id="home">
            <div class="container-fluid">
                <!--button drop down for <1000px-->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <!--Home-->
                        <li class="nav-item">
                            <a class="nav-link active" href="home">Home</a>
                        </li>


                        <!--Product List-->
                        <li class="nav-item">
                            <a class="nav-link" href="productList">Product</a>
                        </li>

                        <!--Login/Logout-->
                        <c:if test="${sessionScope.user==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login">Login</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.user!=null}">
                            <li class="nav-item">
                                <a class="nav-link" href="userProfile">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>

                        <!--Contact-->
                        <li class="nav-item">
                            <a class="nav-link" href="contact">Contact</a>
                        </li>
                    </ul>
            </div>
        </div>
    </nav>
