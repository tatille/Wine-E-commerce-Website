<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-action {
            margin-right: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #bd2130;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Nút quay lại -->
        <a href="/WEBSITEBANRUOU/index" class="btn btn-secondary mb-3">Quay Lại</a>
        
        <h1>GIỎ HÀNG CỦA BẠN</h1>
        <table>
            <thead>
                <tr>
                    <th>Sản Phẩm</th>
                    <th>Giá Tiền</th>
                    <th>Số Lượng</th>
                    <th>Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${cart}">
    <tr>        
        <td>${product.productName}</td>
        <td>${product.productPrice}</td>
        <td>
            <input type="number" value="1" min="1" style="width: 50px;">
        </td>
        <td>
            <!-- Sử dụng ID sản phẩm để xác định sản phẩm cần xóa -->
            <form method="post" action="RemoveFromCartServlet">
                <input type="hidden" name="productID" value="${product.productID}">
                <button type="submit" class="btn btn-danger btn-action">XÓA</button>
            </form>
        </td>
    </tr>
</c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>