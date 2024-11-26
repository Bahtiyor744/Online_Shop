package com.example.category;

import com.example.category.entity.User;
import com.example.category.entity.UserTyre;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class FilterServlet extends HttpFilter {
    List<String> openPages = new ArrayList<>(List.of(
            "/",
            "/Login.jsp",
            "/Register.jsp",
            "/Order.jsp",
            "/Basket.jsp",
            "/Register.jsp",
            "/Add",
            "/AddToCartServlet",
            "/LoginServlet",
            "/PlusMinusServlet",
            "/RegisterSuccess.jsp",
            "/RegisterServlet",
            "/file/1",
            "/file/2",
            "/file/3",
            "/file/4",
            "/file/5",
            "/file/6",
            "/file/7",
            "/file/8",
            "/file/10",
            "/file/11"
    ));
    List<String> adminpage = new ArrayList<>(List.of(
            "/Admin.jsp",
            "/AddProductServlet",
            "/AddCategoryServlet",
            "/DeleteProduct",
            "/DeleteCategory"
    ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (openPages.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
        } else if (user == null) {
            res.sendRedirect("/Login.jsp");
        } else if (user.getUserType().equals(UserTyre.ADMIN)) {
            chain.doFilter(req, res);
        } else if (user.getUserType().equals(UserTyre.USER)) {
            if (adminpage.contains(req.getRequestURI())) {
                res.sendRedirect("/Login.jsp");
            }
            chain.doFilter(req, res);
        } else {
            res.sendRedirect("/Login.jsp");
        }
    }
}
