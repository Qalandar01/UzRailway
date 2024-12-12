package org.example.demo7.servlets;

import org.example.demo7.entity.Seat;
import org.example.demo7.entity.Train;
import org.example.demo7.entity.Wagon;
import org.example.demo7.enums.Destinations;
import org.example.demo7.enums.WagonType;
import org.example.demo7.repo.SeatRepo;
import org.example.demo7.repo.TrainRepo;
import org.example.demo7.repo.WagonRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/train/add")
public class AddTrain extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String departureDate = req.getParameter("departureDate");
        String wagonType = req.getParameter("wagonType");
        int wagonNumbers = Integer.parseInt(req.getParameter("wagonNumbers"));
        int seatPerWagon = Integer.parseInt(req.getParameter("seatsPerWagon"));
        int price = Integer.parseInt(req.getParameter("price"));

        LocalDate date = LocalDate.parse(departureDate);

        Train train = new Train(from, to, date);
        train.setIsActive(true);
        TrainRepo trainRepo = new TrainRepo();
        trainRepo.save(train);
        WagonRepo wagonRepo = new WagonRepo();
        SeatRepo seatRepo = new SeatRepo();
        for (int i = 0; i < wagonNumbers; i++) {
            Wagon wagon = new Wagon(wagonType, train);
            wagon.setIsActive(true);
            wagonRepo.save(wagon);
            for (int j = 0; j < seatPerWagon; j++) {
                Seat seat = new Seat(price,false,wagon);
                seat.setIsActive(true);
                seatRepo.save(seat);
            }
        }
        resp.sendRedirect("/admin/admin.jsp");
    }
}
