<%-- 
    Document   : Login
    Created on : May 11, 2023, 11:21:41 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
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

            <div class="container-fluid">
                <div class="row justify-content-center ">
                    <div class="col-md-3 col-sm-6 col-xs-12 row-container ">
                        <form action="login" method="post">
                            <h1 style="font-size: 26px;">Sign in</h1>
                            <!--Email-->
                            <div class="form-group">
                                <label for="email_id">Email address</label>
                                <input type="email" class="form-control" id="email_id" name="email" placeholder="Enter email">
                                <p class="emailError"></p>
                            </div>

                            <!--Password-->
                            <div class="form-group">
                                <label for="password_id" class="label">Password</label>
                                <input type="password" class="form-control" id="password_id" name="password" placeholder="Password">
                                <p class="passwordError"></p>
                            </div>

                            <!--Remember-->
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="rememberMe_id" name="rememberMe">
                                <label class="form-check-label" for="rememberMe_id">Remember me</label>
                            </div>

                            <!-- -->
                            <!--Forget and dont have account-->
                            <div style="font-size: 15px">
                                <a class="nav-link" href="Register.jsp">Don't have account?</a>
                            </div>

                            <!--Login button onclick="document.getElementById('login').submit()-->
                            <div class="form-group d-flex justify-content-center">
                                <button type="submit" class="button-17">
                                    Login
                                </button>
                            </div>
                            <div style="color: red;">
                                ${message}
                            </div>
                    </form>                            
                </div>
            </div>
        </div>


        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
