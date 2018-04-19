package com.gygproductions.bmwstore.controllers;

import com.gygproductions.bmwstore.dao.DaoFactory;
import com.gygproductions.bmwstore.models.Ad;
import com.gygproductions.bmwstore.models.User;
import com.gygproductions.bmwstore.util.Validate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/post/create")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 *1024 * 50)

public class CreateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user=null;
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String imageAddress = request.getParameter("upload");
        System.out.println(imageAddress);
        Validate validate = new Validate();
        boolean validAttempt = validate.authenticate(title,description,imageAddress,request);
        System.out.println("This is the image URL: " + imageAddress);

        if(session != null){
            user = (User) session.getAttribute("user");
        }

        if(user != null){
            if (validAttempt) {
                Ad ad = new Ad(user.getId(),
                        request.getParameter("title"),
                        request.getParameter("description"),
                        request.getParameter("category"),
                        imageAddress
                );
                DaoFactory.getAdsDao().insert(ad);
                response.sendRedirect("/profile");
            } else {
                // setting this attributes in case the makes a mistake.  User won't loose his input.
                session.setAttribute("title", title);
                session.setAttribute("description", description);
                session.setAttribute("location", imageAddress);
                response.sendRedirect("/ads/create");
            }
        }
    }
}

