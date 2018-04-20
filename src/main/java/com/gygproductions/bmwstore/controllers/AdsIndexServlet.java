package com.gygproductions.bmwstore.controllers;

import com.gygproductions.bmwstore.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/posts")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if(session.isNew()){
            request.setAttribute("navbar", "/WEB-INF/partials/navbar.jsp");
        } else {
            request.setAttribute("navbar", "/WEB-INF/partials/navbar.jsp");
        }

        session.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
