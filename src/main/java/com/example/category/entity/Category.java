package com.example.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private int id = idgen++;
    private String name;
    private static int idgen = 1;

    public Category(String name) {
        this.name = name;
    }
}
