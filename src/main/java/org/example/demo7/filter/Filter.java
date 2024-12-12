package org.example.demo7.filter;

import org.example.demo7.entity.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {
    List<String> openPages = new ArrayList<>(List.of(
            "/",
            "/home.jsp",
            "/login.jsp",
            "/user/login",
            "/register.jsp",
            "/user/register",
            "/train.jsp",
            "/wagon.jsp",
            "/seat.jsp"
    ));
    List<String> userPages = new ArrayList<>(List.of(
            "/buy-ticket",
            "/mytickets.jsp"
    ));
    List<String> adminPages = new ArrayList<>(List.of(
            "/admin/add-seat.jsp",
            "/admin/add-wagon.jsp",
            "/admin/addTrain.jsp",
            "/admin/admin.jsp",
            "/admin/seat-change.jsp",
            "/seat/add",
            "/train/add",
            "/wagon/add",
            "/train/remove",
            "/seat/update",
            "/wagon/remove"

    ));
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (openPages.contains(req.getRequestURI())){
            chain.doFilter(req,res);
            return;
        }
        if (userPages.contains(req.getRequestURI())){
            Object obj = req.getSession().getAttribute("user");
            if (obj == null){
                res.sendRedirect("/login.jsp");
                return;
            }
            User user = (User) obj;
            if (user.getRole().equals("ADMIN") || user.getRole().equals("USER")) {
                chain.doFilter(req,res);
                return;
            }
        }
        if (adminPages.contains(req.getRequestURI())){
            Object obj = req.getSession().getAttribute("user");
            if (obj == null){
                res.sendRedirect("/login.jsp");
                return;
            }
            User user = (User) obj;
            if (user.getRole().equals("ADMIN")){
                chain.doFilter(req,res);
                return;
            }

        }
        res.sendRedirect("/login.jsp");
    }
}
