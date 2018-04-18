package com.gygproductions.bmwstore.controllers;

import com.gygproductions.bmwstore.dao.DaoFactory;
import com.gygproductions.bmwstore.dao.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CreatePasswordServlet", urlPatterns = "/createpassword")
public class CreatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("checkPassword");
        Users usersDao = DaoFactory.getUsersDao();
        String pass = usersDao.hashPassword(password);
        HttpSession session = request.getSession();

        if (pass != null){
            String hashed = String.format("<p style=\"color:blue\"> The hashed password for %s is: %s</p>", password, pass);
            session.setAttribute("createdPassword", hashed);
            response.sendRedirect("/createpassword");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/createPassword.jsp").forward(request, response);
    }
}
