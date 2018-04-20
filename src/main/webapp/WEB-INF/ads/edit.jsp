<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="This Add Page" />
    </jsp:include>
    <link rel="stylesheet" href="/resources/css/profile.css">
</head>
<body>
    <div class="container">
        <div class="container-fluid">
            <img class="blur" src="/resources/img/automobile-bmw-car-707046.jpg" alt="">
            <div class="foreground">
                <jsp:include page="/WEB-INF/partials/navbar.jsp" />
                <div class="row">
                    <div class="col-sm-3"></div>
                    <c:forEach var="ad" items="${single}">
                    <div class="col-sm-6">
                        <form class="form-horizontal" action="/ads/editAd" method="post">
                            <fieldset class="registration-Transparency container-fluid">
                                <div id="legend">
                                    <legend style="font-size: 2.5em">Edit your post</legend>
                                </div>

                                <div class="control-group container-fluid">
                                    ${title_error}
                                    <label class="control-label" for="title"></label>
                                    <div class="controls">
                                        <input id="title" name="titleInput" class="form-control container-fluid" type="text" value=${ad.title}>
                                    </div>
                                </div>

                                <div class="control-group container-fluid">
                                    ${description_error}
                                    <label class="control-label" for="description">Description</label>
                                    <div>
                                        <textarea id="description" name="descriptionInput" class="form-control container-fluid" type="text">${ad.description}</textarea>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary">Submit Changes</button>
                                <p style="text-align: center">Delete ad</p>
                                <input type="checkbox" class="form-check-input" id="deleteAd" name="deleteAd" value="true" style="text-align: center; margin-top: -15px; position: center">
                                <input type="hidden" name="ad-id" id="ad-id" value="${ad.id}">
                                <br>
                            </fieldset>
                        </form>
                    </div>
                    </c:forEach>
                    <div class="col-sm-3"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
