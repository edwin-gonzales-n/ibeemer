<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" href="/resources/css/profile.css">
</head>
<body>
<div class="bgProlife container-fluid div_backgrndimg">
    <img class="blur" src="/resources/img/automobile-bmw-car-707046.jpg" alt="">
    
    <div class="foreground container-fluid">
        <div class="ProfileTransparency container-fluid">

            <jsp:include page="/WEB-INF/partials/navbar.jsp" />

            <h1 style="text-align: center">Welcome ${sessionScope.user.username}!</h1>
            <hr>
            <h1>My Posts</h1><br>

            <div class="container-fluid">
                <div class="row">
                    <c:forEach var="ad" items="${profileAds}">
                        <div class="col-md-6">
                            <h2>${ad.title}</h2>
                            <p>${ad.description}</p>
                            <img src="${ad.location}" style="width: 40%;" alt="test">
                            <h2>${message}</h2>
                            <%--<a class="button" href="/ads/editAd?ad-id=${ad.id}">Edit</a>--%>
                            <input type="button" class="btn btn-primary" onclick="location.href='/ads/editAd?ad-id=${ad.id}';" value="Edit" />
                            <br>
                            <hr>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>

    </div>

</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp" />
<script src="/js/profile.js"></script>

</body>
</html>