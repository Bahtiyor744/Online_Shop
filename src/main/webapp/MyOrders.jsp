<%@ page import="com.example.category.db.DB" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.example.category.entity.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        table th, table td {
            vertical-align: middle;
            text-align: center;
        }
    </style>

</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    String userId = String.valueOf(user.getId());
%>
<div class="container mt-5">
    <h2 class="mb-4">My Orders table</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>STATUS</th>
            <th>DATE</th>
            <th>COUNT</th>
            <th>ACTIONS</th>
            <th>USER ID</th>
        </tr>
        </thead>
        <tbody>
        <!-- Dynamic Rows -->
        <%

            for (Order order : DB.orderList) {
                int count = 0;
                if (order.getUserId() == Integer.parseInt(userId)) {
                    for (OrderItem orderItem : DB.orderItem) {
                        if (order.getId() == orderItem.getOrderId()) {
                            count += 1;
                        }
                    }

        %>
        <tr>
            <td>
                <%=" " + order.getId() + " "%>
            </td>
            <td>
                <%= " " + order.getStatus() + " " %>
            </td>
            <td>
                <%= " " + order.getDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")) + " " %>
            </td>
            <td>
                <%= " " + count + " "  %>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}ViewOrderItem.jsp" method="get"
                      style="display: inline; ">
                    <button class="btn" style="outline: none;
            color: #fff; background:red" name="orderId" value="<%= order.getId()%>">
                        View
                    </button>
                </form>
            </td>
            <td>
                <%= " " + userId + " "  %>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
    <div class="mt-3 text-center">
        <form action="${pageContext.request.contextPath}Order.jsp" method="get">
            <button class="btn btn-lg btn-primary" style="outline: none; background: steelblue; color: #fff;">
                Back
            </button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
