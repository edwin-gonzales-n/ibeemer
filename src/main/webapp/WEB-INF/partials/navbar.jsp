<%@ page import="com.gygproductions.bmwstore.models.User" %>

<%
    User user=null;

    if(session != null){
        user = (User) session.getAttribute("user");
    }

    if(user != null){
        request.setAttribute("navbar",
                "<li><a class=\"navbar-brand\" href=\"/post/create\">Create</a></li>\n" +
                "<li><a class=\"navbar-brand\" href=\"/profile\">Profile</a></li>" +
                "<li><a class=\"navbar-brand\" href=\"/logout\">Logout</a></li>\n");
    }  else {
        request.setAttribute("navbar",
                "<li><a class=\"navbar-brand\" href=\"/register\">Register</a></li>");
        request.setAttribute("droplogin","/WEB-INF/droplogin.jsp");
    }
%>

<nav class="navbar navbar-expand-lg navbar-light container-fluid">
        <a class="navbar-brand" href="/">Home</a>
        <a class="navbar-brand" href="/posts">Members' Posts</a>
        <ul class="nav navbar-nav navbar-right">
            ${navbar}
            <jsp:include page="${droplogin}" />
        </ul>
    <%--</div><!-- /.container-fluid -->--%>
</nav>
