package com.example.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id = idGen++;
    private String name;
    private String password;
    private UserTyre userType;
    private static int idGen = 1;

    public User(String name, String password, UserTyre userType) {
        this.name = name;
        this.password = password;
        this.userType = userType;
    }
}
