package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Order;
import com.example.category.entity.OrderItem;
import com.example.category.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/AddOrder")
public class AddOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if (cookies == null) {
            resp.sendRedirect("Login.jsp");
        }
        boolean enter = false;
        String userId = null;
        assert cookies != null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token") && cookie.getValue().equals(Token.getValue())) {
                enter = true;
            } else if (cookie.getName().equals("userId")) {
                userId = cookie.getValue();
            }
        }
        if (!enter) {
            resp.sendRedirect("Login.jsp");
            return;
        }
        assert userId != null;
        Order order = new Order(Integer.parseInt(userId));
        DB.orderList.add(order);

        for (Map.Entry<Product, Integer> entry : DB.orders.entrySet()) {
            Product product = entry.getKey();
            Integer amount = entry.getValue();
            DB.orderItem.add(new OrderItem(order.getId(), product.getId(), amount));
        }
        DB.orders.clear();
        resp.sendRedirect("/Success.jsp");
    }
}
