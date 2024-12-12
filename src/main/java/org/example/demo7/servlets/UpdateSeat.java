package org.example.demo7.servlets;

import org.example.demo7.entity.Seat;
import org.example.demo7.repo.SeatRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/seat/update")
public class UpdateSeat extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int price = Integer.parseInt(req.getParameter("price"));
        int seatId = Integer.parseInt(req.getParameter("seatId"));
        SeatRepo.updatePrice(seatId,price);

        resp.sendRedirect("/admin/admin.jsp");
    }
}
