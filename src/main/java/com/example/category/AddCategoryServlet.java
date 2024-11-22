package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Category;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String categoryName = req.getParameter("category");
        DB.categorys.add(new Category(categoryName));
        resp.sendRedirect("/AddCategoryAndProduct.jsp?name=category");
    }
}
