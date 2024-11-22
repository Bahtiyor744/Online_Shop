package com.example.category;

import com.example.category.db.DB;
import com.example.category.entity.Product;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet("/file/*")
@MultipartConfig
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        String pathInfo = req.getPathInfo();
        int productid = Integer.parseInt(pathInfo.split("/")[1]);
        Product product = DB.products.stream().filter(item -> item.getId() == productid).findFirst().orElseThrow();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(product.getPhotoUrl())));
    }
}
