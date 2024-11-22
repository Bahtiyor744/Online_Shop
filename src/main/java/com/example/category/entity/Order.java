package com.example.category.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private int id = idGen++;
    private Status status = Status.NEW;
    private LocalDateTime date = LocalDateTime.now();
    private int userId;
    private static int idGen = 1;

    public Order(int userId) {
        this.userId = userId;
    }
}
