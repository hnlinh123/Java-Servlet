<%-- 
    Document   : Contract
    Created on : Jul 13, 2023, 5:29:28 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:set value="${sessionScope.ProductList}" var="productList"/>
        <c:set value="${sessionScope.foodList}" var="foodList"/>
        <c:set value="${sessionScope.drinkList}" var="drinkList"/>
        <c:set value="${sessionScope.otherList}" var="otherList"/>

        <!-- Carousel -->            
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

        <!--Head session-->
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1 class="display-4">Welcome ${sessionScope.user.userName}</h1>
                </div>
                <div class="col-12">
                    <p style="text-align: center;">
                        This is a website is about review food! Enjoy our posts and let we know if there is any issue!
                    </p>
                </div>
                <!-- Horizontal Rule -->
                <hr>
                <div class="col-12">
                    <a class="nav-link" href="productList"><h1>Product</h1></a>
                </div>
            </div>
        </div>

        <!--Info session-->
        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="container-fluid padding">
                    <div class="row padding">
                        <div class="col-12">
                            <h2 style="text-align: center;">Some infomation</h2>
                            <div style="text-align: justify; left: 10%;">
                                <p>
                                    Welcome to our delectable corner of the internet! 
                                    We are thrilled to present to you our vibrant food 
                                    review website, where culinary exploration knows no 
                                    bounds. Whether you're a seasoned gourmet or an adventurous 
                                    foodie on the hunt for new flavors, this platform is designed 
                                    o satiate your cravings and ignite your taste buds. 
                                </p>
                                <p>
                                    With every bite, we embark on a delicious journey, 
                                    uncovering hidden gems and popular establishments alike. 
                                    Our dedicated team of passionate food enthusiasts scours
                                    the culinary landscape, venturing into bustling street
                                    markets, cozy cafes, haute cuisine restaurants, and 
                                    everything in between. Our mission? To offer you an
                                    authentic, mouth-watering account of gastronomic
                                    experiences that will leave you hungry for more. 
                                </p>

                                <p>
                                    We believe that food is not merely sustenance but a 
                                    symphony of flavors, textures, and aromas that can
                                    transport us to far-off lands or evoke cherished 
                                    memories. Through our reviews, we aim to capture 
                                    the essence of each dish, painting a vivid picture
                                    that tantalizes both the mind and the palate. From 
                                    delightful street food to innovative fusion creations, 
                                    we leave no plate unturned in our pursuit of exceptional
                                    dining encounters.
                                </p>

                                <p>
                                    But our website is not just about sharing opinions; 
                                    it's an interactive community where fellow food 
                                    enthusiasts gather to exchange recommendations, 
                                    share recipes, and revel in the joy of all 
                                    things culinary. Here, you'll find a treasure
                                    trove of curated content, including expert tips, 
                                    behind-the-scenes stories, and interviews with 
                                    celebrated chefs, all serving as inspiration for 
                                    your own culinary adventures.
                                </p>

                                <p>
                                    So join us on this epicurean odyssey, where every page 
                                    is a feast for the senses. Let our reviews be your 
                                    trusted guide, opening doors to unforgettable dining
                                    experiences and bringing you closer to the remarkable
                                    tapestry of global cuisine. Get ready to embark on a 
                                    mouthwatering journey that will leave you with a 
                                    profound appreciation for the artistry of food. Bon 
                                    appétit!
                                </p>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <hr class="my-2">
            </div>
            <hr class="my-4">
        </div>

        <!-- Contact-->
        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="container-fluid padding">
                    <div class="row padding">
                        <div class="col-12">
                            <h2 style="text-align: center;">Contact</h2>
                            <div style="text-align: justify; left: 10%;">
                                <form action="contact" method="post">
                                    <div class="row">
                                        <div class="col-25">
                                            Email: 
                                        </div>
                                        <div class="col-75">
                                            <input type="text" name="email">
                                        </div>
                                    </div>   
                                    <div class="row">
                                        <div class="col-25">
                                            Message: <br>
                                        </div>
                                        <div class="col-75">
                                            <textarea name="message" rows="5" cols="10"></textarea><br>
                                        </div>
                                    </div>
                                    <input type="submit" class="button-17" name="ok" value="Submit">
                                </form>
                            </div>
                            <br>
                        </div>

                    </div>
                </div>
                <hr class="my-2">
            </div>
            <hr class="my-4">
        </div>
    </body>
</html>
