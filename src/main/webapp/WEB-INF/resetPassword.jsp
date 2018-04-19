<%--
  Created by IntelliJ IDEA.
  User: gonzoingermany
  Date: 4/18/18
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="resetPassword" value="Reset password" />
    </jsp:include>
</head>
<body>
<div class="register-bg">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <form class="form-horizontal" action='/resetpassword' method="POST">
                    <fieldset class="registration-Transparency container-fluid">
                        <div id="legend">
                            <legend style="font-size: 2.5em">Reset Password</legend>
                        </div>
                        <div class="control-group">
                            ${password_mismatch}
                            ${emailExist_error}
                            <!-- Username -->
                            <label class="control-label"  for="email">Email</label>
                            <div class="controls">
                                <input type="text" id="email" name="email" placeholder="email you registered with" class="input-xlarge">
                            </div>
                        </div>

                        <div class="control-group">
                            <!-- Password-->
                            <label class="control-label" for="password">New Password</label>
                            <div class="controls">
                                <input type="password" id="password" name="newPassword" placeholder="at least 4 characters" class="input-xlarge">
                            </div>
                        </div>

                        <div class="control-group">
                            <!-- Password -->
                            <label class="control-label"  for="validatePassword">Password (Confirm)</label>
                            <div class="controls">
                                <input type="password" id="validatePassword" name="validatePassword" placeholder="confirm password" class="input-xlarge">
                            </div>
                        </div>
                        <br>
                        <div class="control-group">
                            <!-- Button -->
                            <div class="controls">
                                <button class="btn btn-primary">Reset Password</button>
                            </div>
                            <p style="color: blue">${success}</p>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/scripts.jsp" />
</body>
</html>
