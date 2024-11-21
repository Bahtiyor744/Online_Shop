package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String categoryId = req.getParameter("categoryId");
        String action = req.getParameter("action");
        if (productId != null) {
            int id = Integer.parseInt(productId);
            Product productToAdd = null;
            for (Product product : DB.products) {
                if (product.getId() == id) {
                    productToAdd = product;
                    break;
                }
            }

            if ("add".equals(action)) {
                DB.orders.put(productToAdd,1);
            } else if ("remove".equals(action)) {
                DB.orders.remove(productToAdd);
            }
        }

        resp.sendRedirect("Order.jsp?categoryId=" + categoryId);
    }
}
