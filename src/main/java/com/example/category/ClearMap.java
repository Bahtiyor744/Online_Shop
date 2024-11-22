package com.example.category;

import com.example.category.db.DB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ClearMap")
public class ClearMap extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        DB.orders.clear();

        response.sendRedirect(request.getContextPath() + "/Success.jsp");
    }

}
