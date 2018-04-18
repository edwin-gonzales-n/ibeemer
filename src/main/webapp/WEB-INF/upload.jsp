<%--
  Created by IntelliJ IDEA.
  User: Gonzo
  Date: 4/12/18
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head></head>
<body>
<form action="upload" method="post" enctype="multipart/form-data">
    Please enter file name:<input type="text" name="fileName">
    Select File to Upload:<input type="file" name="picture">
    <br>
    <input type="submit" value="Upload">
</form>
</body>
</html>
