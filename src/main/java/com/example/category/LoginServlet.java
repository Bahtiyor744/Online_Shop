package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.User;
import com.example.category.entity.UserTyre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    public static User current_user;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        current_user = DB.users.stream()
                .filter(user -> user.getName().equals(name) && user.getPassword().equals(password))
                .findFirst()
                .orElse(null);

        if (current_user.getUserType().equals(UserTyre.USER)) {
            resp.sendRedirect("/Order.jsp");
        } else {
            resp.sendRedirect("/AddCategoryAndProduct.jsp");
        }
    }


}
