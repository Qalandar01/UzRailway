package org.example.demo7.repo;

import jakarta.persistence.EntityManager;
import org.example.demo7.base.BaseRepo;
import org.example.demo7.entity.Wagon;

import java.awt.desktop.UserSessionEvent;
import java.util.List;

import static org.example.demo7.listener.MyListener.EMF;

public class WagonRepo extends BaseRepo<Wagon> {
    public static Wagon getAllWagonsByTrainId(int id, Integer wagon_num) {
        wagon_num--;
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return (Wagon) entityManager.createNativeQuery("select * from wagon w where w.isactive = true and w.train_id = :trainId  limit 1 offset :off", Wagon.class)
                    .setParameter("trainId", id)
                    .setParameter("off", wagon_num).getSingleResult();
        }
    }

    public static Integer countWagons(int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("select count(w.id) from Wagon w where w.train.id = :trainId and w.isActive = true ", Long.class)
                    .setParameter("trainId", id)
                    .getSingleResult().intValue();
        }
    }

    public static Wagon getWagonBySeatId(Integer seatId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Wagon w join Seat" +
                            " s on w.id = s.wagon.id where s.id = :seatId", Wagon.class)
                    .setParameter("seatId", seatId)
                    .getSingleResult();
        }
    }

    public static List<Wagon> getAllWagonsByTrainId(Integer trainId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            return entityManager.createQuery("from Wagon w where w.train.id = :trainId and w.isActive = true ", Wagon.class)
                    .setParameter("trainId", trainId).getResultList();

        }
    }

    public static Wagon getWagonByWagonId(Integer wagonId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
           return entityManager.find(Wagon.class,wagonId);

        }
    }

    public static void remove(int wagonId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            entityManager.getTransaction().begin();
            Wagon wagon = entityManager.find(Wagon.class, wagonId);
            wagon.setIsActive(false);
            entityManager.getTransaction().commit();
        }
    }
}
