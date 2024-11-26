package com.example.category;

import com.example.category.db.DB;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteCategory")
public class DeleteCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        DB.categorys.removeIf(category -> category.getId() == categoryId);
        resp.sendRedirect("/Admin.jsp?name=category");
    }
}
