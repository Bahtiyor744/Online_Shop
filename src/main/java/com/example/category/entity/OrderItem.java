package com.example.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private int id = idGen++;
    private int orderId;
    private int productId;
    private int amount;
    private static int idGen = 1;

    public OrderItem(int orderId, int productId, int amount) {
        this.orderId = orderId;
        this.productId = productId;
        this.amount = amount;
    }
}
