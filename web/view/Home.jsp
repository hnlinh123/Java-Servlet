<%-- 
    Document   : Home
    Created on : Feb 10, 2023, 9:15:43 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>

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
                <img src="${pageContext.request.contextPath}/image/FoodCa.jpg" style="height: 400px">
                <div class="carousel-caption">
                    <h1 class="display-2">Food</h1>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/image/DrinkCa.jpg" style="height: 400px">
                <div class="carousel-caption">
                    <h1 class="display-2">Drinks</h1>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/image/OtherCa.jpg" style="height: 400px">
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

    <!--Product session-->
    <div class="container-fluid padding">
        <div class="row text-center padding">
            <div class="col-xs-12 col-sm-6 col-md-4 ">
                <i class="fab"></i>
                <img src="${pageContext.request.contextPath}/image/Food.png" alt="food" width="150px" />
                <a class="nav-link" href="productList?searchPattern=Food"><h3>Food</h3></a>
                <p style="text-align: justify;">
                    <br>Welcome to the delightful world of food! 
                    This is your passport to a mouthwatering adventure 
                    where we celebrate all things delicious. In this culinary 
                    haven, we will tantalize your taste buds, introduce you to 
                    exciting flavors, and inspire your inner chef.  From quick and easy meals to gourmet 
                    masterpieces, let's embark on this flavorful journey 
                    together!
                </p>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4">
                <i class="fab"></i>
                <img src="${pageContext.request.contextPath}/image/Drink.png" alt="drink" width="250px" />
                <a class="nav-link" href="productList?searchPattern=Drink"><h3>Drink</h3></a>
                <p style="text-align: justify;">
                    <br>Welcome to our beverage oasis! Discover a world 
                    of tantalizing drinks as we explore flavors, origins, 
                    and expert tips. Join us on this intoxicating journey, 
                    celebrating the artistry behind every glass. Cheers to new
                    flavors, memorable moments, and the joy of indulging 
                    in well-crafted beverages. Bottoms up!
                </p>

            </div>
            <div class="col-sm-12 col-md-4">
                <i class="fab"></i>
                <img src="${pageContext.request.contextPath}/image/Others.png" alt="others" width="200px" />
                <a class="nav-link" href="productList?searchPattern=Others"><h3>Others</h3></a>
                <p style="text-align: justify;">
                    <br>Welcome to a fruity paradise! Immerse yourself in the 
                    vibrant world of fruits as we celebrate nature's sweetest 
                    treasures. Join us as we explore a kaleidoscope of colors,
                    flavors, and health benefits. From juicy berries to tropical
                    delights, let's discover the refreshing allure of nature's
                    bountiful harvest!
                
                </p>
            </div>
        </div>
        <hr class="my-4">
    </div>

    <!--Information session-->
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

    <!--contact session-->
    <div class="container-fluid padding">
        <div class="row text-center padding">
            <div class="col-12">
                <h2>Contact us</h2>
            </div>
            <div class="col-12 social padding">
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo_fb.png" alt="facebook" style="width: 50px"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo_tw.png" alt="twitter" style="width: 50px"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo_ggplus.png" alt="GGplus"  style="width: 50px"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo_ins.png" alt="instagram" style="width: 50px"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo_ytb.png" alt="youtube"  style="width: 50px"></a>
            </div>      
        </div>
    </div>

    <hr class="my-2">

    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>

