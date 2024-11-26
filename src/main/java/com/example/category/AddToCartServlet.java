package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Basket;
import com.example.category.entity.Product;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productId = req.getParameter("productId");
        String categoryId = req.getParameter("categoryId");
        String action = req.getParameter("action");
        if (productId != null) {
            int id = Integer.parseInt(productId);
            Product productToAdd = DB.products.stream().filter(product -> product.getId() == id).findFirst().orElseThrow();
            HttpSession session = req.getSession();
            Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
            if ("add".equals(action)) {
                basket.getMap().put(productToAdd, 1);
                session.setAttribute("basket", basket);
            } else if ("remove".equals(action)) {
                basket.getMap().remove(productToAdd, 1);
                session.setAttribute("basket", basket);
            }
        }

        resp.sendRedirect("Order.jsp?categoryId=" + categoryId);
    }
}
