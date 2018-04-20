package com.gygproductions.bmwstore.controllers;

import com.gygproductions.bmwstore.dao.DaoFactory;
import com.gygproductions.bmwstore.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PostSearchServlet",urlPatterns = "/postsearch")
public class PostSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.isNew()){
            request.setAttribute("navbar", "/WEB-INF/partials/navbar.jsp");
        } else {
            request.setAttribute("navbar", "/WEB-INF/partials/navbar.jsp");
        }

        String searchBox = request.getParameter("search");

        List<Ad> ads = DaoFactory.getAdsDao().searchPosts(searchBox);
        session.setAttribute("ads", ads);

        request.getRequestDispatcher("/WEB-INF/ads/searchPosts.jsp")
                .forward(request, response);
    }
}
