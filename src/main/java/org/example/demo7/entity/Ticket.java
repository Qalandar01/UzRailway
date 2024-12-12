package org.example.demo7.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.demo7.base.BaseEntity;

import java.time.LocalDate;


@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Ticket extends BaseEntity {
    @ManyToOne
    User user;
    @ManyToOne
    Seat seat;
    private Boolean isActive;

    public Ticket(User user, Seat seat) {
        this.user = user;
        this.seat = seat;
    }
}
