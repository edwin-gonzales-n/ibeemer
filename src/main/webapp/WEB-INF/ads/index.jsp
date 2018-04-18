<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Posts" />
    </jsp:include>
</head>
<body>

<div class="posts-Transparency">
<jsp:include page="${navbar}"/>
    <br>
        <h1>B&B - Beamers and Blogs</h1>
        <br>
        <div class="container">
            <c:forEach var="ad" items="${ads}">
                <div class="row container-fluid">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10" >
                        <img src="${ad.location}" style="width: 100%; text-align: center" alt="test">
                        <br>
                        <a href="/ads/single?ad-id=${ad.id}" class="text-center center-block"><h1>${ad.title}</h1></a>
                        <article class="container-fluid article-justify" style="text-align: justify; width: 100%">${ad.description}</article>
                        <br>
                        <p>Categories: ${ad.category} | Created on: ${ad.created_on}</p>
                        <hr>
                        <br>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
