<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rodgerscott
  Date: 4/10/18
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="This Add Page" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <hr>
    <div class="row">
        <c:forEach var="ad" items="${single}">
            <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <h2>${ad.title}</h2>
                    <br>
                    <img src="${ad.location}" alt="test" style="text-align: justify; width: 100%">
                    <br><br>
                    <p class="description" style="text-align: justify; width: 100%">${ad.description}</p>
                    <h5 class="price">Posted by ${ad.username}   |  Created on: ${ad.created_on}</h5>
                </div>
            <div class="col-sm-1"></div>
        </c:forEach>
    </div>
</div>
</body>
</html>