<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom styles here */
    </style>
</head>
<body>
    <div class="container">
        <h3>DANH SÁCH SẢN PHẨM ĐANG CÓ TRÊN WEB SITE CỦA BẠN!</h3>
        <p style="color: red;">${errorString}</p>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>MÃ SP</th>
                    <th>TÊM SP</th>
                    <th>LOẠI SẢN PHẨM</th>
                    <th>GIÁ</th>
                    <th>HÌNH ẢNH</th>
                    <th>SỬA</th>
                    <th>XÓA</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td>${product.productID}</td>
                        <td>${product.productName}</td>
                        <td>${product.productType}</td>
                        <td>${product.productPrice}</td>
                        <td><img src="${product.productImg}" height="20px" width="20px" /></td>
                        <td><a href="editProductServlet?ID=${product.productID}" class="btn btn-primary">Edit</a></td>
                        <td><a href="confirmDelete?ID=${product.productID}" class="btn btn-danger">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="newProduct.jsp" class="btn btn-success">THÊM SẢN PHẨM MỚI</a>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
