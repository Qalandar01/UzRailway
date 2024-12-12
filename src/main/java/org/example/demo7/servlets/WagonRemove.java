package org.example.demo7.servlets;

import org.example.demo7.repo.WagonRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/wagon/remove")
public class WagonRemove extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int wagonId = Integer.parseInt(req.getParameter("wagonId"));
        String trainId = req.getParameter("trainId");
        WagonRepo.remove(wagonId);
        resp.sendRedirect("/admin/add-wagon.jsp?trainId="+trainId);
    }
}
