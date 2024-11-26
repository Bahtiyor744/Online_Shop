package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        if (confirmPassword.equals(password)) {
            DB.users.add(new User(firstName, lastName, email, password));
            resp.sendRedirect("RegisterSuccess.jsp");
        } else {
            resp.sendRedirect("/Login.jsp");
        }
    }
}

