package org.example.demo7.servlets;

import org.example.demo7.entity.Seat;
import org.example.demo7.entity.Train;
import org.example.demo7.entity.Wagon;
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

@WebServlet("/wagon/add")
public class AddWagon extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer trainId = Integer.parseInt(req.getParameter("trainId"));
        String wagonType = req.getParameter("wagonType");
        int numberOfSeats = Integer.parseInt(req.getParameter("numberOfSeats"));
        int price = Integer.parseInt(req.getParameter("pricePerSeat"));
        Train train = TrainRepo.getTrainById(trainId);
        WagonRepo wagonRepo = new WagonRepo();
        SeatRepo seatRepo =new SeatRepo();
        Wagon wagon = new Wagon(wagonType,train);
        wagon.setIsActive(true);
        wagonRepo.save(wagon);
        for (int i = 0; i < numberOfSeats; i++) {
            Seat seat = new Seat(price,false,wagon);
            seat.setIsActive(true);
            seatRepo.save(seat);
        }
        resp.sendRedirect("/admin/admin.jsp");
    }
}
