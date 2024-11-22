package com.example.category.db;
import com.example.category.entity.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DB {
    List<User> users = new ArrayList<>(List.of(
            new User("admin", "123", UserTyre.ADMIN),
            new User("user", "123", UserTyre.USER)
    ));

    List<Category> categorys = new ArrayList<>(List.of(
            new Category("Mevalar"),
            new Category("Ichimliklar")
    ));

    List<Product> products = new ArrayList<>(List.of(
            new Product("Apple", 1, 500, "D:/G46/Category/files/apple.jpg"),
            new Product("Capucino", 2, 700, "D:/G46/Category/files/cofe.jpg"),
            new Product("Banan", 1, 6240000, "D:/G46/Category/files/Banan.jpg"),
            new Product("Apelsin", 1, 1000, "D:/G46/Category/files/Apelsin.jpg"),
            new Product("Juice", 2, 1500, "D:/G46/Category/files/juice.jpg"),
            new Product("RedBull", 2, 2000, "D:/G46/Category/files/redbull.jpg")
    ));

    List<Order> orderList = new ArrayList<>();

    List<OrderItem> orderItem = new ArrayList<>();
    Map<Product, Integer> orders = new HashMap<>();



}
