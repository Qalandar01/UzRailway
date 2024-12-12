package org.example.demo7.servlets;

import org.example.demo7.repo.TrainRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/train/remove")
public class TrainRemove extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("trainId"));
        TrainRepo.remove(id);
        resp.sendRedirect("/admin/admin.jsp");

    }
}
