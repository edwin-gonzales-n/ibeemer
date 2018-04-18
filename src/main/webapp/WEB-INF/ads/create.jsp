<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar_logout.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                ${title_error}
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value=${title}>
            </div>
            <div class="form-group">
                ${description_error}
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${description}</textarea>
            </div>
            <div class="form-group">
                ${price_error}
                <label for="price">Price</label>
                <input id="price" name="price" class="form-control" type="text" value=${price}>
            </div>
            <div class="form-group">
                <label for="fileupload">Upload image</label>
                Please enter file name:<input id="fileupload" type="text" name="fileName">
                Select File to Upload:<input type="file" name="picture">
            </div>

            <fieldset>
                <legend>Category</legend>
                <select id="newAdCat" name="category">
                    <option value="1">Infant Clothes</option>
                    <option value="2">Toddler Clothes</option>
                    <option value="3">Baby Accessories</option>
                    <option value="4">Toys</option>
                    <option value="5">Books</option>
                    <option value="6">Strollers</option>
                    <option value="7">Cribs</option>
                    <option value="8">Car Seats</option>
                </select>
            </fieldset>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
