<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="Model.Product" %>
<html>
<head>
    <title>Confirm Delete</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Hãy kiểm tra đã đúng ID và tên sảm phẩm chưa? nếu đúng ấn xác nhận!</h2>
        <% 
            Product productToDelete = (Product) request.getAttribute("productToDelete");
            if (productToDelete != null) {
        %>
            <div class="card">
                <div class="card-body">
                    <p>ID: <%= productToDelete.getProductID() %></p>
                    <p>Name: <%= productToDelete.getProductName() %></p>
                    <!-- More product details -->
                    <form action="deleteProduct" method="post">
                        <input type="hidden" name="ID" value="<%= productToDelete.getProductID() %>">
                        <button class="btn btn-danger" type="submit">XÁC NHẬN XÓA</button>
                    </form>
                </div>
            </div>
        <% } else { %>
            <p>không tìm thấy nữa!</p>
        <% } %>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
