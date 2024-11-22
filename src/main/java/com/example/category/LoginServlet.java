package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.User;
import com.example.category.entity.UserTyre;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;
import java.util.Optional;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        Optional<User> userOptional = DB.users.stream()
                .filter(user -> user.getName().equals(name) && user.getPassword().equals(password))
                .findFirst();
        if (userOptional.isPresent()) {
            int id = userOptional.get().getId();
            String idString = String.valueOf(id);
            if (userOptional.get().getUserType().equals(UserTyre.USER)) {
                resp.addCookie(new Cookie("token", Token.getValue()));
                resp.addCookie(new Cookie("userId", idString));
                resp.sendRedirect("/Order.jsp");
            } else {
                resp.addCookie(new Cookie("token", Token.getValue()));
                resp.sendRedirect("/AddCategoryAndProduct.jsp");
            }
        } else {
            resp.sendRedirect("/Login.jsp");
        }
    }


}
