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

@WebServlet("/PlusMinusServlet")
public class PlusMinusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productIdStr = req.getParameter("productId");
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());


        if (productIdStr != null && action != null) {
            try {
                int productId = Integer.parseInt(productIdStr);

                Product product = DB.products.stream()
                        .filter(p -> p.getId() == productId)
                        .findFirst()
                        .orElse(null);

                if (product != null && basket.getMap().containsKey(product)) {
                    int currentQuantity = basket.getMap().get(product);
                    if ("plus".equals(action)) {
                        basket.getMap().put(product, currentQuantity + 1);
                    } else if ("minus".equals(action) && currentQuantity > 0) {
                        basket.getMap().put(product, currentQuantity - 1);
                        if (basket.getMap().get(product) == 0) {
                            basket.getMap().remove(product);
                        }
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        session.setAttribute("basket", basket);
        resp.sendRedirect("/Basket.jsp");
    }


}
