<%@ page import="com.example.category.db.DB" %>
<%@ page import="com.example.category.entity.Product" %>
<%@ page import="com.example.category.entity.Category" %>
<%@ page import="com.example.category.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.11.2024
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

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

        table th:not(:first-child), table td:not(:first-child) {
            vertical-align: middle;
            text-align: center;
        }

        table .first_td {
            width: 100px;
            height: 100px;
        }

    </style>
</head>
<body>
<%
    String name = request.getParameter("name");
%>

<div class="row col-12 main_menu">
    <!-- start_left_menu -->
    <div class="col-2 left_menu d-flex flex-column justify-content-between" style="height: 100vh;">
        <!-- Верхняя часть меню -->
        <div>
            <div class="categories">Welcome</div>
            <ul>
                <li class="<%= name == null || name.equals("category") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/Admin.jsp?name=category">
                        Category
                    </a>
                </li>

                <li class="<%= name != null && name.equals("product") ? "active" : "" %>">
                    <a href="${pageContext.request.contextPath}/Admin.jsp?name=product">
                        Product
                    </a>
                </li>
            </ul>
        </div>

        <div class="user-info text-center">
            <hr>
            <div class="user-icon mb-2">
                <i class="bi bi-person-circle" style="font-size: 48px; color: #6c757d;"></i>
            </div>
            <div class="user-name">
                <p style="margin: 0; font-weight: bold;">
                    <%= session.getAttribute("user") != null ? ((User)session.getAttribute("user")).getUserType() : "Guest" %>
                </p>
            </div>
        </div>
    </div>


    <!-- end_left_menu -->


    <div class="col-10 right_content">
        <!-- Login button -->

        <div class="col-12 text p-3" style="position: relative;">
            <a href="Order.jsp" class="btn btn-outline-primary" style="position: absolute; top: 0; right: 90px; margin: 10px;">
                Online shop</a>
            <a href="Login.jsp" class="btn btn-outline-primary" style="position: absolute; top: 0; right: 0; margin: 10px;">
                Log out</a>
        </div>

        <%-- Start Category --%>
        <%
            if (name == null || name.equals("category")) {
        %>
        <div class="row mb-4">
            <div class="col-6">
                <h2>Category Table</h2>
            </div>
            <div class="col-6 text-end">
                <button type="button" class="btn btn-primary" style="position: absolute; top: 50px; right: 25px; margin: 10px;"
                        data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                    ADD
                </button>
            </div>
        </div>

        <table class="table table-bordered table-hover" style="margin-right: 10px">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dynamic Rows -->
            <%
                for (Category category : DB.categorys) {
            %>
            <tr>
                <td><%= category.getId() + " " %>
                </td>
                <td><%= category.getName() + " " %>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/DeleteCategory" method="post"
                          style="display: inline; ">
                        <button class="btn" style="outline: none;
            color: #fff; background:red" name="categoryId" value="<%= category.getId() %>">Delete
                        </button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            }
        %>
        <%-- End Category --%>

        <%-- Start Product --%>
        <%
            if (name != null && name.equals("product")) {
        %>
        <div class="row mb-4">
            <div class="col-6">
                <h2>Products Table</h2>
            </div>
            <div class="col-6 text-end">
                <button type="button" class="btn btn-primary" style="position: absolute; top: 50px; right: 25px; margin: 10px;"
                        data-bs-toggle="modal" data-bs-target="#addProductModal">
                    ADD
                </button>
            </div>
        </div>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>Photo</th>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dynamic Rows -->
            <%
                for (Product product : DB.products) {
            %>
            <tr>
                <td class="first_td">
                    <img src="${pageContext.request.contextPath}/file/<%=product.getId()%>" alt="Product Photo"
                         style="width: 100%; height: 100%;">
                </td>
                <td><%= product.getId() + " " %>
                </td>
                <td><%= product.getName() + " " %>
                </td>
                <td><%=  product.getPrice() + " " %>
                </td>
                <td><%=  product.getCategory_id() + " " %>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/DeleteProduct" method="post"
                          style="display: inline; ">
                        <button class="btn" style="outline: none;
            color: #fff; background:red" name="productId" value="<%= product.getId() %>">Delete
                        </button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            }
        %>
        <%-- End Product --%>
    </div>
</div>

<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddProductServlet" method="post"
                      enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" class="form-control" id="productImage" name="image" required>
                    </div>

                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Product Price</label>
                        <input type="text" class="form-control" id="productPrice" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select class="form-select" id="productCategory" name="category_id" required>
                            <%
                                for (Category category : DB.categorys) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Product</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/AddCategoryServlet" method="post">
                    <!-- Input для загрузки изображения -->
                    <div class="mb-3">
                        <label for="CategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="CategoryName" name="name" required>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Category</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>


</body>
</html>
