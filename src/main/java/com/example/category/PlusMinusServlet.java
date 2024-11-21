package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PlusMinusServlet")
public class PlusMinusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String productid = req.getParameter("product");
        System.out.println(productid);
        System.out.println(productid);
        System.out.println(productid);
//        if(name.equals("plus")){
//            DB.orders.
//        }

        resp.sendRedirect("/AddCategoryAndProduct.jsp?name=category");
    }
}
