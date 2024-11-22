<%@ page import="com.example.category.db.DB" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.category.entity.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Products Table</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Photo</th>
            <th>Name</th>
            <th>Price</th>
            <th>Count</th>
            <th>Actions</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dynamic Rows -->
        <%
            double totalSum = 0;
            for (Map.Entry<Product, Integer> entry : DB.orders.entrySet()) {
                double productTotal = entry.getKey().getPrice() * entry.getValue();
                totalSum += productTotal;
        %>
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/file/<%=entry.getKey().getId()%>" alt="Product Photo"
                     style="width: 100px; height: 100px;">
            </td>
            <td><%= entry.getKey().getName() + " " %>
            </td>
            <td><%= entry.getKey().getPrice() + " " %>
            </td>
            <td><%=  entry.getValue() %>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/PlusMinusServlet" method="get"
                      style="display: inline; ">
                    <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                    <button class="btn" style="outline: none;
            color: #fff; background:red" name="action" value="minus">-
                    </button>
                </form>
                <form action="${pageContext.request.contextPath}/PlusMinusServlet" method="get"
                      style="display: inline;">
                    <input type="hidden" name="productId" value="<%= entry.getKey().getId() %>">
                    <button class="btn" style="outline: none;
            color: #fff; background : #5252b6" name="action" value="plus">+
                    </button>
                </form>
            </td>
            <td><%=entry.getKey().getPrice() * entry.getValue() %>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
        <tfoot>
        <tr class="table-success">
            <td colspan="5" class="text-end"><strong>Total:</strong></td>
            <td><strong><%= totalSum %>
            </strong></td>
        </tr>
        </tfoot>
    </table>
    <div class="mt-3 text-center">
        <form action="${pageContext.request.contextPath}/AddOrder" method="get">
            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #fff;">
                Go
            </button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
