<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="iBeemer" />
    </jsp:include>
</head>
<body>

    <div id="bgimage-main" class="bg">
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <header class="container-fluid">
            <div class="row">
                <div id="test" class="col-sm-12 main-title">
                    <h1>iBeemer</h1>
                    <h2>The BMW Exchange Community</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="active-cyan-3 active-cyan-4 mb-4">
                        <form action="/posts">
                            <input class="form-control search-transparency btn-outline-dark" type="text" placeholder="Search" aria-label="Search" id="search-box-main">
                            <button style="display: none"></button>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </header>
    </div>

    <br>

    <section class="container-fluid">
        <div class="row">
            <div class="col-sm-4 container-fluid paddingLeft">
                <img src="/resources/img/AdobeStock_182448719.jpg" alt="" style="width: 100%">
            </div>

            <div class="col-sm-4 container-fluid paddingMiddle">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="/resources/img/AdobeStock_130496805.jpeg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/resources/img/AdobeStock_55251611.jpeg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="/resources/img/AdobeStock_18464950.jpeg" alt="Third slide">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 container-fluid paddingRight">
                <img src="/resources/img/AdobeStock_17555962.jpg" alt="" style="width: 100%">
            </div>
        </div>
    </section>
    <br>

    <section class="container-fluid">
        <div class="row">

            <div class="col-sm-4 container-fluid nopadding">
                <iframe class="container-fluid" width="560" height="315" src="https://www.youtube.com/embed/0IHWqf7vprQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>

            <div class="col-sm-4 container-fluid nopadding">
                <h2>iBeemer is a user based BMW enthusiast community who get together on a monthly basis to test drive beemers, upgrade, and even hangout!</h2>
            </div>

            <div class="col-sm-4 container-fluid nopadding">
                <iframe class="container-fluid" width="560" height="315" src="https://www.youtube.com/embed/DQ5iHSknWIY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>

        </div>
    </section>

    <br>

    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
