package com.example.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private int id = idgen++;
    private String name;
    private int category_id;
    private int price;
    private String photoUrl;
    private static  int idgen = 1;

    public Product(String name, int category_id, int price, String photoUrl) {
        this.name = name;
        this.category_id = category_id;
        this.price = price;
        this.photoUrl = photoUrl;
    }

    public Product(String name, int category_id, int price) {
        this.name = name;
        this.category_id = category_id;
        this.price = price;
    }
}
