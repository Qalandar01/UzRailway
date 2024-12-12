package org.example.demo7.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.demo7.base.BaseEntity;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "users")
public class User extends BaseEntity {

    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private String role;
}
