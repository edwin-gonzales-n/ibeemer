<%@ page import="com.gygproductions.bmwstore.models.User" %>

<%
    User user=null;

    if(session != null){
        user = (User) session.getAttribute("user");
    }

    if(user != null){
        request.setAttribute("navbar", "<li><a class=\"navbar-brand\" href=\"/ads/search\">Search</a></li>\n" +
                "<li><a class=\"navbar-brand\" href=\"/logout\">Logout</a></li>\n" +
                "<li><a class=\"navbar-brand\" href=\"/ads/create\">Create</a></li>\n" +
                "<li><a class=\"navbar-brand\" href=\"/profile\">Profile</a></li>");
    }  else {
//        request.setAttribute("navbar", "<li><a class=\"navbar-brand\" href=\"/ads/search\">Search</a></li>\n" +
//                "<li><a class=\"navbar-brand\" href=\"/register\">Register</a></li>\n" +
//                "<li><a class=\"navbar-brand\" href=\"/login\">Login</a></li>");
        request.setAttribute("navbar", "<li><a class=\"navbar-brand\" href=\"/ads/search\">Search</a></li>\n" +
                "<li><a class=\"navbar-brand\" href=\"/register\">Register</a></li>");
        request.setAttribute("droplogin","/WEB-INF/droplogin.jsp");
    }
%>

<nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="/">Home</a>
        <a class="navbar-brand" href="/ads">Members' Posts</a>
        <ul class="nav navbar-nav navbar-right">
            ${navbar}
            <jsp:include page="${droplogin}" />
        </ul>
    <%--</div><!-- /.container-fluid -->--%>
</nav>
