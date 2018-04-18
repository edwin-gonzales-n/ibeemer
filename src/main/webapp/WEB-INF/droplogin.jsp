<%--
  Created by IntelliJ IDEA.
  User: gonzoingermany
  Date: 4/17/18
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
    <li class="dropdown order-1">
        <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-dark dropdown-toggle">Login <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right mt-2 loginTransparency">
            <li class="px-3 py-2">
                <form class="form" role="form">
                    <div class="form-group">
                        <input id="emailInput" placeholder="Email" class="form-control form-control-sm" type="text" required="">
                    </div>
                    <div class="form-group">
                        <input id="passwordInput" placeholder="Password" class="form-control form-control-sm" type="text" required="">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </div>
                    <div class="form-group text-center">
                        <small><a href="#" data-toggle="modal" data-target="#modalPassword">Forgot password?</a></small>
                    </div>
                </form>
            </li>
        </ul>
    </li>
</ul>




