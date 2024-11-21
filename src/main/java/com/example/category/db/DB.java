package com.example.category.db;

import com.example.category.entity.Category;
import com.example.category.entity.Product;
import com.example.category.entity.User;
import com.example.category.entity.UserTyre;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DB {
    List<User> users = new ArrayList<>(List.of(
            new User("admin", "123", UserTyre.ADMIN),
            new User("user", "123",UserTyre.USER)
    ));

    List <Category> categorys = new ArrayList<>(List.of(
            new Category("Mevalar"),
            new Category("Ichimliklar")
    ));

    List <Product> products = new ArrayList<>(List.of(
            new Product("Olma",1,500,"D:/G46/Category/files/apple.jpg"),
            new Product("Capucino",2,700,"D:/G46/Category/files/cofe.jpg")
    ));

    Map<Product, Integer> orders = new HashMap<>();


}
