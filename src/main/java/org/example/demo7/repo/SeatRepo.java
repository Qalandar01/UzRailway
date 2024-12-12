package org.example.demo7.repo;

import jakarta.persistence.EntityManager;
import org.example.demo7.base.BaseRepo;
import org.example.demo7.entity.Seat;

import java.util.List;

import static org.example.demo7.listener.MyListener.EMF;

public class SeatRepo extends BaseRepo<Seat> {
    public static List<Seat> getSeatsByWagonId(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Seat s where s.wagon.id = :wagonId and s.isActive = true ", Seat.class)
                    .setParameter("wagonId", id)
                    .getResultList();
        }
    }

    public static Seat getSeatById(Integer id) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.find(Seat.class, id);
        }
    }

    public static void changeStatus(Seat seat) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            entityManager.getTransaction().begin();
            Seat seat1 = entityManager.find(Seat.class, seat.getId());
            seat1.setStatus(true);
            entityManager.getTransaction().commit();
        }
    }

    public static void updatePrice(int seatId, int price) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            entityManager.getTransaction().begin();
            Seat seat = entityManager.find(Seat.class, seatId);
            seat.setPrice(price);
            entityManager.getTransaction().commit();
        }
    }
}
