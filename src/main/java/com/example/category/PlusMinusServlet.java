package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Product;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PlusMinusServlet")
public class PlusMinusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String productIdStr = req.getParameter("productId");
        String action = req.getParameter("action");


        if (productIdStr != null && action != null) {
            try {
                int productId = Integer.parseInt(productIdStr);

                Product product = DB.products.stream()
                        .filter(p -> p.getId() == productId)
                        .findFirst()
                        .orElse(null);

                if (product != null && DB.orders.containsKey(product)) {
                    int currentQuantity = DB.orders.get(product);
                    if ("plus".equals(action)) {
                        DB.orders.put(product, currentQuantity + 1);
                    } else if ("minus".equals(action) && currentQuantity > 0) {
                        DB.orders.put(product, currentQuantity - 1);
                        if (DB.orders.get(product) == 0) {
                            DB.orders.remove(product);
                        }
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Перенаправление обратно на страницу
        resp.sendRedirect("/Basket.jsp");
    }


}
