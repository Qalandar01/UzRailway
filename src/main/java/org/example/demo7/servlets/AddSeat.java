package org.example.demo7.servlets;

import org.example.demo7.entity.Seat;
import org.example.demo7.entity.Wagon;
import org.example.demo7.repo.SeatRepo;
import org.example.demo7.repo.WagonRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/seat/add")
public class AddSeat extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer wagonId = Integer.parseInt(req.getParameter("wagonId"));
        Integer price = Integer.parseInt(req.getParameter("price"));
        int amount = Integer.parseInt(req.getParameter("amount"));
        if (amount <= 0){
            amount = 1;
        }
        Wagon wagon = WagonRepo.getWagonByWagonId(wagonId);
        SeatRepo seatRepo = new SeatRepo();
        for (int i = 0; i < amount; i++) {
            Seat seat = new Seat(price,false,wagon);
            seat.setIsActive(true);
            seatRepo.save(seat);
        }

        resp.sendRedirect("/admin/add-seat.jsp?wagonId="+wagonId);

    }
}
