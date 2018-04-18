<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>

<div class="posts-bg">
<jsp:include page="${navbar}"/>
<br>
    <h1>B&B - Beamers and Blogs</h1>
    <br>
    <div class="container">
            <c:forEach var="ad" items="${ads}">
                <div class="row container-fluid">
                    <div class="col-sm" >
                        <img src="${ad.location}" style="width: 50%; height: 30%; text-align: center" alt="test">
                        <h3>${ad.title}</h3>
                        <article class="container-fluid">${ad.description}</article>
                        <br>
                        <p>Categories: ${ad.category}</p>
                        <p>Price: $${ad.price}</p>
                        <img src="${ad.location}" style="width: 50%; height: 30%; text-align: center" alt="test">
                        <a href="/ads/single?ad-id=${ad.id}" class="text-center center-block">View Full Ad</a>
                    </div>
                </div>
            </c:forEach>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
