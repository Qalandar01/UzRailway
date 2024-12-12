package org.example.demo7.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.demo7.base.BaseEntity;
import org.example.demo7.enums.WagonType;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
public class Wagon extends BaseEntity {
    private String wagonType;
    private Boolean isActive;

    public Wagon(String wagonType, Train train) {
        this.wagonType = wagonType;
        this.train = train;
    }

    @ManyToOne
    Train train;
}
