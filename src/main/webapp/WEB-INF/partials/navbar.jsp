<%@ page import="com.gygproductions.bmwstore.models.User" %>

<%
    User user=null;

    if(session != null){
        user = (User) session.getAttribute("user");
    }

    if(user != null){
        request.setAttribute("navbar",
                "<li class=\"nav-item\"><a class=\"navbar-brand\" href=\"/post/create\">Create</a></li>\n" +
                "<li class=\"nav-item\"><a class=\"navbar-brand\" href=\"/profile\">Profile</a></li>" +
                "<li class=\"nav-item\"><a class=\"navbar-brand\" href=\"/logout\">Logout</a></li>\n");
    }  else {
        request.setAttribute("navbar",
                "<li class=\"nav-item\"><a class=\"navbar-brand\" href=\"/register\">Register</a></li>");
        request.setAttribute("droplogin","/WEB-INF/droplogin.jsp");
    }
%>

<nav class="navbar navbar-expand-lg navbar-light container-fluid">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="navbar-brand" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="navbar-brand" href="/posts">Members' Posts</a>
            </li>
            ${navbar}
            <jsp:include page="${droplogin}" />
        </ul>
    <%--</div><!-- /.container-fluid -->--%>
</nav>

<%--<div class="collapse navbar-collapse">--%>
    <%--<ul class="navbar-nav mr-auto">--%>
        <%--<li class="nav-item active">--%>
            <%--<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
        <%--</li>--%>
        <%--<li class="nav-item">--%>
            <%--<a class="nav-link" href="#">Link</a>--%>
        <%--</li>--%>
        <%--<li class="nav-item dropdown">--%>
            <%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                <%--Dropdown--%>
            <%--</a>--%>
            <%--<div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
                <%--<a class="dropdown-item" href="#">Action</a>--%>
                <%--<a class="dropdown-item" href="#">Another action</a>--%>
                <%--<div class="dropdown-divider"></div>--%>
                <%--<a class="dropdown-item" href="#">Something else here</a>--%>
            <%--</div>--%>
        <%--</li>--%>
        <%--<li class="nav-item">--%>
            <%--<a class="nav-link disabled" href="#">Disabled</a>--%>
        <%--</li>--%>
    <%--</ul>--%>
    <%--<form class="form-inline my-2 my-lg-0">--%>
        <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
    <%--</form>--%>
<%--</div>--%>