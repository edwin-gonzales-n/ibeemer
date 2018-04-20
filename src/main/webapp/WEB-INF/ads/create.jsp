<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <link rel="stylesheet" href="/resources/css/profile.css">
</head>
<body>
    <div class="container-fluid">
        <img class="blur" src="/resources/img/automobile-bmw-car-707046.jpg" alt="">
        <div class="foreground">
            <jsp:include page="/WEB-INF/partials/navbar.jsp" />
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <form class="form-horizontal" action="/post/create" method="post">
                        <fieldset class="registration-Transparency container-fluid">
                            <div id="legend">
                                <legend style="font-size: 2.5em">Create New Post</legend>
                            </div>

                            <div class="control-group container-fluid">
                                ${title_error}
                                <label class="control-label" for="title">Title</label>
                                <div class="controls">
                                    <input id="title" name="title" class="form-control container-fluid" type="text" value=${title}>
                                </div>
                            </div>

                            <div class="control-group container-fluid">
                                ${description_error}
                                <label class="control-label" for="description">Description</label>
                                <div>
                                    <textarea id="description" name="description" class="form-control container-fluid" type="text">${description}</textarea>
                                </div>
                            </div>
                            <br>

                            <div class="control-group">
                                <div class="controls">
                                    <button onclick="openPicker()" type="button" class="btn btn-link btn-secondary">Upload Image</button>
                                </div>
                            </div>
                            <div id="picUrl">

                            </div>
                            <%--image goes here--%>
                            <div id="posts" class="container-fluid">
                            </div>
                            <br>
                            <select id="newAdCat" name="category" class="custom-select btn-secondary" style="text-align: center; width: 50%">
                                <option selected>Categories</option>
                                <option value="1">X1</option>
                                <option value="2">X3</option>
                                <option value="3">X5</option>
                                <option value="4">M3</option>
                                <option value="5">M5</option>
                                <option value="6">M8</option>
                                <option value="7">Classics</option>
                                <option value="8">For Sale</option>
                            </select>
                            <br>
                            <br>
                            <input type="submit" class="btn btn-link btn-secondary">
                        </fieldset>
                    </form>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>

    </div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />

<script src="https://static.filestackapi.com/v3/filestack.js"></script>
<script type="text/javascript">
    // FILESTACK JSON CALL
    var fsClient = filestack.init('An8EGKOh9TGGuI8Vymqonz');
    function openPicker() {
        fsClient.pick({
            fromSources:["local_file_system", "url","imagesearch","facebook","instagram","dropbox"],
            accept:["image/*"],
            maxFiles:1
        }).then(function(response) {
            // declare this function to handle response
            handleFilestack(response);
        });
    }

    function handleFilestack(response){
        console.log(response);
        $('#posts').append('<div class="container">');
        $('#picUrl').append('<input type="text" id="upload" name="upload" value=" ' +response.filesUploaded['0'].url +  '">');
        $('#posts').append('<img src=" ' + response.filesUploaded['0'].url + ' " alt="\"\ style="\width: 40%\">');
        $('#posts').append('</div>');

        // document.getElementById('upload').innerText = response.filesUploaded['0'].handle;
        document.getElementById('upload').dataset.handler = response.url;
    }
</script>
</body>
</html>
