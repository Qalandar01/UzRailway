package org.example.demo7.servlets;

import org.example.demo7.entity.Seat;
import org.example.demo7.entity.Ticket;
import org.example.demo7.entity.User;
import org.example.demo7.repo.SeatRepo;
import org.example.demo7.repo.TicketRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/buy-ticket")
public class PurchaseTicket extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String trainId = req.getParameter("trainId");
        String wagonNum = req.getParameter("wagon_num");
        Object object = session.getAttribute("user");
        if (object == null) {
            resp.sendRedirect("/login.jsp");
            return;
        }
        User  user = (User) object;
        Integer seatId = Integer.parseInt(req.getParameter("seatId"));
        Seat seat = SeatRepo.getSeatById(seatId);
        SeatRepo.changeStatus(seat);

        Ticket ticket = new Ticket(user,seat);
        TicketRepo ticketRepo = new TicketRepo();
        ticketRepo.save(ticket);
        resp.sendRedirect("/wagon.jsp?successMessage=Ticket purchased successfully!&trainId="+trainId+"&wagon_num="+wagonNum);

    }
}
