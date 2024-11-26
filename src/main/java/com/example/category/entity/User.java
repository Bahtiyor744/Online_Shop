package com.example.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id = idGen++;
    private String firstname;
    private String lastName;
    private String password;
    private UserTyre userType = UserTyre.USER;
    private String email;
    private static int idGen = 1;

    public User(String firstname, String lastName, String password, UserTyre userType, String email) {
        this.firstname = firstname;
        this.lastName = lastName;
        this.password = password;
        this.userType = userType;
        this.email = email;
    }

    public User(String firstname, String lastName, String password, String email) {
        this.firstname = firstname;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
    }
}
