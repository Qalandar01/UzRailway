package org.example.demo7.repo;

import jakarta.persistence.EntityManager;
import org.example.demo7.base.BaseRepo;
import org.example.demo7.entity.Ticket;
import org.example.demo7.entity.User;

import java.util.List;

import static org.example.demo7.listener.MyListener.EMF;

public class UserRepo extends BaseRepo<User> {

    public static User getUser(String phone, String password) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            List<User> users = entityManager.createQuery(
                            "from User u where u.password = :password and u.phone = :phone", User.class)
                    .setParameter("password", password)
                    .setParameter("phone", phone)
                    .getResultList();

            return users.isEmpty() ? null : users.get(0);
        }
    }

    public static List<Ticket> getUserTickets(Integer userId) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
           return entityManager.createQuery("from Ticket t where t.user.id = :userId",Ticket.class)
                    .setParameter("userId",userId)
                    .getResultList();
        }
    }
}
