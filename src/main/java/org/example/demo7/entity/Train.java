package org.example.demo7.entity;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.demo7.base.BaseEntity;
import org.example.demo7.enums.Destinations;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity

public class Train extends BaseEntity {
    private String fromm;
    private String too;

    public Train(String fromm, String too, LocalDate date) {
        this.fromm = fromm;
        this.too = too;
        this.date = date;
    }

    private Boolean isActive;
    private LocalDate date;
}
