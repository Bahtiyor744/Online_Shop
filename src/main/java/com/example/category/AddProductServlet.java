package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Category;
import com.example.category.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

@WebServlet("/AddProductServlet")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    String path = "D:/G46/Category/files/";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("product");
        int price = Integer.parseInt(req.getParameter("price"));
        int categoryid = Integer.parseInt(req.getParameter("categoryid"));
        Part productImg = req.getPart("productImg");
        Files.write(Path.of(path +name +".jpg"), productImg.getInputStream().readAllBytes());
        String photoUrl = path +name +".jpg";
        DB.products.add(new Product(name,categoryid,price,photoUrl));
        resp.sendRedirect("/AddCategoryAndProduct.jsp?name=product");
    }
}
