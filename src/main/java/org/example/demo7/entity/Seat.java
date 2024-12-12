package org.example.demo7.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.demo7.base.BaseEntity;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Entity
public class Seat extends BaseEntity {
    private Integer price;
    private Boolean status;
    private Boolean isActive;

    public Seat(Integer price, Boolean status, Wagon wagon) {
        this.price = price;
        this.status = status;
        this.wagon = wagon;
    }

    @ManyToOne
    Wagon wagon;
}
