<%@ page import="com.example.category.db.DB" %>
<%@ page import="com.example.category.entity.Category" %>
<%@ page import="com.example.category.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20.11.2024
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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

        .order_cards {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .modal .order_cards .order_card {
            width: 100%;
        }

        .order_card {
            width: 30%;
            gap: 20px;
            border: 1px solid #dadada;
            padding: 4px 4px 8px 4px;
            border-radius: 12px;
            margin-bottom: 0;
        }

        .order_card .info_card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 4px 10px 12px;
        }

        .order_card .info_card:first-child {
            font-size: 24px;
            font-weight: bold;
        }

        .order_card button {
            width: 100%;
        }

        .order_card img {
            width: 100%;
            height: 330px;
            border-radius: 8px;
            object-fit: cover;
        }


        .btn_add {
            outline: none;
            color: #fff;
            background: #5252b6;
            border: none;
            border-radius: 10px;
            min-width: 32px;
            min-height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn_cancel {
            outline: none;
            color: #fff;
            background: red;
            border: none;
            border-radius: 10px;
            min-width: 32px;
            min-height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        .header_order {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 32px;
        }

        .order {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 26px;
            border: 1px solid #dadada;
            width: 20%;
            padding: 4px 12px;
            border-radius: 8px;
        }

        .modal_count_add {
            display: flex;
            align-items: center;
            flex-direction: column;
            gap: 8px;
        }

        /* end_oreder_cards */

        /* start_right_content */

        .your_order {
            font-weight: bold;
            font-size: 26px;
            text-align: center;
        }

        /* end_right_content */
    </style>

</head>
<body>
<%
    String categoryId = request.getParameter("categoryId");
    if (categoryId == null) {
        categoryId = "0";
    }
    List<Product> filteredProducts = new ArrayList<>();
    if (categoryId.equals("0")) {
        filteredProducts = DB.products;
    } else {
        try {
            int categoryIdInt = Integer.parseInt(categoryId);
            for (Product product : DB.products) {
                if (product.getCategory_id() == categoryIdInt) {
                    filteredProducts.add(product);
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Ошибка: Неверный формат categoryId");
        }
    }
%>
<div class="row col-12 main_menu">
    <!-- start_left_menu -->
    <div class="col-2 left_menu">
        <div class="categories">Categories</div>
        <ul>
            <li class="<%= (categoryId.equals("0")) ? "active" : "" %>">
                <a href="Order.jsp?categoryId=0">
                    All
                </a>
            </li>
            <%
                for (Category category : DB.categorys) {
            %>
            <li class="<%= Integer.parseInt(categoryId) == (category.getId()) ? "active" : "" %>">
                <a href="Order.jsp?categoryId=<%=category.getId()%>">
                    <%=category.getName()%>
                </a>
            </li>
            <%
                }
            %>
        </ul>
        <div class="col-12 text p-3">
            <a href="Login.jsp" class="btn btn-primary">Log out</a>
        </div>
    </div>
    <!-- end_left_menu -->

    <!-- start_oreder_cards -->
    <%
        Map<Product, Integer> cart = DB.orders;
        int totalQuantity = 0;
        for (Integer count : cart.values()) {
            totalQuantity += count;
        }
    %>
    <div class="col-10 right_content">
        <div class="header_order">
            <div class="order"><span>Savatcha:</span> <span><%=totalQuantity%></span></div>
            <a class="btn btn-primary"
               href="Basket.jsp"
               role="button"
            >Savatcha</a>
        </div>
        <div class="order_cards row">
            <%
                for (Product product : filteredProducts) {
                    boolean isInCart = cart.containsKey(product);
            %>
            <form action="${pageContext.request.contextPath}/AddToCartServlet" method="post" class="order_card col-8">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <input type="hidden" name="categoryId" value="<%= categoryId %>">
                <input type="hidden" name="action" value="<%= isInCart ? "remove" : "add" %>">
                <img src="${pageContext.request.contextPath}/file/<%=product.getId()%>" alt="">
                <div class="info_card">
                    <span><%= product.getName() %></span>
                    <span><%= product.getPrice() %></span>
                </div>
                <button type="submit" class="<%= isInCart ? "btn_cancel" : "btn_add" %>">
                    <%= isInCart ? "Cancel" : "Add" %>
                </button>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <!-- end_oreder_cards -->
</div>
<!-- start-dialog -->
<div
        class="modal fade"
        id="exampleModalToggle"
        aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel"
        tabindex="-1"
>
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <div class="your_order">Buyurtmalar:</div>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <div class="order_cards row">
                    <%
                        double totalSum = 0;
                        for (Map.Entry<Product, Integer> entry : DB.orders.entrySet()) {
                            double productTotal = entry.getKey().getPrice() * entry.getValue();
                            totalSum += productTotal;
                    %>
                    <div class="order_card col-12">
                        <img class="order_car" src="${pageContext.request.contextPath}/file/<%=entry.getKey().getId()%>"
                             alt="">
                        <span><%= entry.getKey().getName() + " " %></span>
                        <div>
                            <span><%= entry.getKey().getPrice() + " " %></span>
                            <span>*</span>
                            <span><%=  entry.getValue() %></span>
                            <span><%=" = "%></span>
                            <span><%=entry.getKey().getPrice() * entry.getValue() %></span>
                        </div>
                        <div class="modal_count_add">
                            <form action="${pageContext.request.contextPath}/PlusMinusServlet" method="get"
                                  style="display: inline;">
                                <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                                <button class="btn_add" name="action" value="minus">-</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/PlusMinusServlet" method="get"
                                  style="display: inline;">
                                <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                                <button class="btn_add" name="action" value="plus">+</button>
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="total_sum">
                        <span>Total:</span>
                        <span><%= totalSum %></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/ClearMap" method="post">
                    <button class="btn_add">
                        Buyurtma
                    </button>
                </form>

            </div>
        </div>
    </div>
</div>

<!-- end-dialog -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>