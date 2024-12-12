package org.example.demo7.base;

import jakarta.persistence.EntityManager;

import static org.example.demo7.listener.MyListener.EMF;

public class BaseRepo<T> {
    public void save(T object) {
        try (
                EntityManager entityManager = EMF.createEntityManager();
        ) {
            entityManager.getTransaction().begin();
            entityManager.persist(object);
            entityManager.getTransaction().commit();
        }
    }
}
