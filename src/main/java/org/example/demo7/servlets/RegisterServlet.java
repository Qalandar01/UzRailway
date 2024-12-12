package org.example.demo7.servlets;

import org.example.demo7.entity.User;
import org.example.demo7.repo.UserRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        if (firstname == null || lastname == null || phone == null || password == null) {
            resp.sendRedirect("/register.jsp");
            return;
        }
        User user = new User(firstname, lastname, phone, password, "USER");
        UserRepo userRepo = new UserRepo();
        userRepo.save(user);
        resp.sendRedirect("/login.jsp");
    }
}
