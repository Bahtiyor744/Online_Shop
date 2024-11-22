<%@ page import="com.example.category.db.DB" %>
<%@ page import="com.example.category.entity.Category" %>
<%@ page import="com.example.category.entity.Product" %>
<%@ page import="com.example.category.Token" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21.11.2024
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <style>
        /* start_left_menu */

        .categories {
            font-size: 32px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 32px;
        }

        .main_menu {
            height: 100vh;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        .active a {
            background: blue;
        }

        .active a {
            color: #fff;
        }

        .active a:hover {
            background: blue;
        }

        ul li {
            margin-bottom: 4px;
        }

        ul li a {
            text-decoration: none;
            color: #000;
            padding: 10px 24px;
            width: 100%;
            display: block;
            border-radius: 0 20px 20px 0;
        }

        ul li a:hover {
            background: #00000020;
        }

        .left_menu {
            padding: 32px 12px;
            background: #d8d8d8;
        }

        /* end_left_menu */
        /* start_oreder_cards */

        .right_content {
            padding: 32px 64px;
            border-right: 1px solid #dadada;
        }

        .modal-body .order_card {
            border-radius: 4px;
            margin-bottom: 12px;
        }

        .modal-body .order_card:last-child {
            margin-bottom: 0;
        }

        .order_card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            border: 1px solid #dadada;
            padding: 4px 6px;
            border-radius: 12px;
            margin-bottom: 24px;
        }


        /* end_oreder_cards */


    </style>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies == null) {
        response.sendRedirect("Login.jsp");
    }
    boolean enter = false;
    assert cookies != null;
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("token") && cookie.getValue().equals(Token.getValue())) {
            enter = true;
        }
    }
    if (!enter){
        response.sendRedirect("Login.jsp");
        return;
    }
    String name = request.getParameter("name");
%>
<div class="row col-12 main_menu">
    <!-- start_left_menu -->
    <div class="col-2 left_menu">
        <div class="categories">Welcome</div>
        <ul>
            <li class="<%= name == null || name.equals("category") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/AddCategoryAndProduct.jsp?name=category">
                    Category
                </a>
            </li>

            <li class="<%= name != null && name.equals("product") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/AddCategoryAndProduct.jsp?name=product">
                    Product
                </a>
            </li>
        </ul>
    </div>
    <!-- end_left_menu -->


    <div class="col-10 right_content">
        <!-- Category button -->

        <div class="col-12 text p-3" style="position: relative;">
            <a href="Login.jsp" class="btn btn-primary" style="position: absolute; top: 0; right: 0; margin: 10px;">Log out</a>
        </div>
        <%
            if (name == null || name.equals("category")) {
        %>
        <h2>Add Category</h2>
        <form action="${pageContext.request.contextPath}/AddCategoryServlet" method="POST">
            <div class="form-group">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Category Name" name="category" required>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Add</button>
        </form>
        <%
            for (Category category : DB.categorys) {
        %>
        <div class="order_card col-12">
            <span><%= category.getId() %></span>
            <span><%= category.getName() %></span>
        </div>
        <%
                }
            }
        %>

        <%
            if (name != null && name.equals("product")) {
        %>

        <h2>Add Product</h2>
        <form action="${pageContext.request.contextPath}/AddProductServlet" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Product Name" name="product" required>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Price" name="price" required>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Category Id" name="categoryid" required>
                </div>
                <div class="btn btn-primary; mb-3">
                    <input type="file" name="productImg">
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Add</button>
        </form>

        <%
            for (Product product : DB.products) {
        %>
        <div class="order_card col-12">
            <span><%= product.getId() %></span>
            <span><%= product.getName() %></span>
            <span><%= product.getPrice() %></span>
            <span><%= product.getCategory_id() %></span>
        </div>
        <%
                }
            }
        %>
    </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ltrjvnR4/Jqs6HpHG0D2My/j9fVfQUknpR1tt83Kfg8Uld4rB4ChfSAf8iYKSjH/"
        crossorigin="anonymous"></script>
</body>
</html>
