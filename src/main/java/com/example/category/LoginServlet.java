package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Basket;
import com.example.category.entity.User;
import com.example.category.entity.UserTyre;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String firstName = req.getParameter("name");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        Basket basket = (Basket) session.getAttribute("basket");
        Optional<User> userOptional = DB.users.stream()
                .filter(user -> user.getFirstname().equals(firstName) && user.getPassword().equals(password))
                .findFirst();
        if (userOptional.isPresent()) {
            System.out.println(userOptional.get());
            session.setAttribute("user", userOptional.get());
            if (userOptional.get().getUserType().equals(UserTyre.USER)) {
                if (basket != null) {
                    resp.sendRedirect("/Basket.jsp");
                } else {
                    resp.sendRedirect("/Order.jsp");
                }
            } else if (userOptional.get().getUserType().equals(UserTyre.ADMIN)) {
                resp.sendRedirect("/Admin.jsp");
            }
        } else {
            resp.sendRedirect("/Login.jsp");
        }
    }


}
