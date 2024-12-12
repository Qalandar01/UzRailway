package org.example.demo7.servlets;

import org.example.demo7.entity.User;
import org.example.demo7.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        if (phone == null || password == null){
            resp.sendRedirect("/login.jsp");
            return;
        }
        User user = UserRepo.getUser(phone, password);
        if (user == null){
            resp.sendRedirect("/login.jsp");
            return;
        }
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        if (user.getRole().equals("ADMIN")) {
            resp.sendRedirect("/admin/admin.jsp");
            return;
        }
        resp.sendRedirect("/home.jsp");
    }
}
