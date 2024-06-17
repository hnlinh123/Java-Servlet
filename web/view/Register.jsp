<%-- 
    Document   : Register
    Created on : May 11, 2023, 11:21:48 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
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
            <div class="bg2">
                <div class="container-fluid">
                    <div class="row justify-content-center ">
                        <div class="col-md-3 col-sm-6 col-xs-12 row-container ">
                            <form action="register" method="post" onsubmit="alertForContactMessage()">
                                <h1 style="font-size: 26px;">Create new account</h1>

                                <!--Name-->
                                <div class="form-group">
                                    <label for="userName">Your name:</label>
                                    <input type="text" class="form-control" id="userName" placeholder="Enter name">     
                                </div>

                                <!--Email-->
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter email">
                                    <p class="emailError"></p>
                                </div>

                                <!--Password-->
                                <div class="form-group">
                                    <label for="password" class="label">Password:</label>
                                    <input type="password" class="form-control" id="password" placeholder="Password">
                                    <p class="passwordError"></p>
                                </div>

                                <!--DoB-->
                                <div class="form-group">
                                    <label for="dob">Date of birth:</label>
                                    <input type="date" class="form-control" id="dob" name="dob">     
                                </div>
                                
                                <div class="form-group">
                                    Gender:
                                    <input type="radio" class="form-control" name="gender" value="male"> Male
                                    <input type="radio" class="form-control" name="gender" value="female">Female
                                </div>

                                <!--Address-->
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" placeholder="Enter address">     
                                </div>

                                <!--Forget and have account-->
                                <div style="font-size: 15px">
                                    <a class="nav-link" href="ForgetPassword.jsp">Forget password?</a>
                                    <a class="nav-link" href="Login.jsp">Already have account?</a>
                                </div>

                                <!--Login button-->
                                <div class="form-group d-flex justify-content-center">
                                    <button type="submit" class="button-17">
                                        Create account
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
