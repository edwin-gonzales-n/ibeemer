package com.gygproductions.bmwstore.controllers;

import com.gygproductions.bmwstore.dao.DaoFactory;
import com.gygproductions.bmwstore.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", urlPatterns = "/resetpassword")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        User user = DaoFactory.getUsersDao().findByEmail(email);
        HttpSession session = request.getSession();

        if(user != null){
            String newPassword = request.getParameter("newPassword");
            String validatePassword = request.getParameter("validatePassword");
            System.out.println(email);

            if (newPassword.equals(validatePassword)){
                session.setAttribute("email", email);
                session.setAttribute("newPassword", newPassword);
                String update = DaoFactory.getUsersDao().resetPassword(newPassword,email);
                session.setAttribute("success", update);
                response.sendRedirect("/resetpassword");
                System.out.println(update);
            } else {
                session.setAttribute("password_mismatch", "<p style=\"color:red\">Sorry \"passwords\" do not match!</p>");
                response.sendRedirect("/resetpassword");
            }

        } else {
            session.setAttribute("emailExist_error", "<p style=\"color:red\">Sorry \"email\" does not exist</p>");
            response.sendRedirect("/resetpassword");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/resetPassword.jsp").forward(request, response);
    }
}
