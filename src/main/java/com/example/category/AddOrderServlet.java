package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

@WebServlet("/AddOrder")
public class AddOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String userId = String.valueOf(user.getId());
        Order order = new Order(Integer.parseInt(userId));
        order.setStatus(Status.COMPLETED);
        DB.orderList.add(order);
        Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
        for (Map.Entry<Product, Integer> entry : basket.getMap().entrySet()) {
            Product product = entry.getKey();
            Integer amount = entry.getValue();
            DB.orderItem.add(new OrderItem(order.getId(), product.getId(), amount));
        }
        basket.getMap().clear();
        session.setAttribute("basket", basket);
        resp.sendRedirect("/Success.jsp");
    }
}
