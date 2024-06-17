<%-- 
    Document   : UserProfile
    Created on : Jul 12, 2023, 11:36:44 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User ${user.getUserName()}</title>
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
        <form action="userProfile" method="post">
            <c:set value="${sessionScope.user}" var="user"></c:set>
                <div class="container">
                    <div class="col-12">
                        <h1>${user.getUserName()}</h1>

                    <table>
                        <tr>
                            <td>Name:</td>
                            <td><input type="text" name="userName" value="${user.getUserName()}"><br></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address" value="${user.getAddress()}"><br></td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td>${user.getGender()}</td>
                        </tr>
                        <tr>
                            <td><br>DOB:</td>
                            <td>${user.getDob()}</td>
                        </tr>
                        <tr>
                            <td><br>Email:</td>
                            <td><input type="text" name="email" value="${user.getEmail()}"></td>
                        </tr>
                        <tr>
                            <td><br>Password:</td>
                            <td><input type="text" name="password" value="${user.getPassword()}" placeholder="You want new password?"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="button-17"type="submit" name="update" value="Update">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
