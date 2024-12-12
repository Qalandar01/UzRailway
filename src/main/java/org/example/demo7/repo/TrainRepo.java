package org.example.demo7.repo;

import jakarta.persistence.EntityManager;
import org.example.demo7.base.BaseRepo;
import org.example.demo7.entity.Train;

import java.time.LocalDate;
import java.util.List;

import static org.example.demo7.listener.MyListener.EMF;

public class TrainRepo extends BaseRepo<Train> {

    public static List<Train> getAllTrains(String from, String to, String departureDate) {


        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            LocalDate date = LocalDate.parse(departureDate);
            return entityManager.createQuery("from Train t where t.fromm = :from and t.too = :to and t.date = :departureDate and t.isActive = true ", Train.class)
                    .setParameter("from", from)
                    .setParameter("to", to)
                    .setParameter("departureDate", date)
                    .getResultList();
        }
    }

    public static List<Train> getAllTrains() {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Train t where t.isActive = true ", Train.class).getResultList();
        }
    }

    public static Train getTrainById(Integer trainId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.find(Train.class, trainId);
        }
    }

    public static Train getTrainBySeatId(Integer seatId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Train t join Wagon w on t.id = w.train.id join Seat s on s.wagon.id = w.id where s.id = :seatId", Train.class)
                    .setParameter("seatId", seatId)
                    .getSingleResult();
        }
    }

    public static void remove(int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager();

        ) {
            entityManager.getTransaction().begin();
            Train train = entityManager.find(Train.class, id);
            train.setIsActive(false);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
