<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CHỈNH SỬA THÔNG TIN SẢN PHẨM CỦA BẠN!</title>
    <!-- Thêm đường dẫn đến Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Cải thiện margin và padding cho form */
        form {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>CHỈNH SỬA THÔNG TIN SẢN PHẨM CỦA BẠN!</h1>
        <form method="POST" action="editProductServlet" enctype="multipart/form-data">
            <div class="form-group">
                <label for="ID">MÃ SP:</label>
                <input type="text" class="form-control" id="ID" name="ID" value="${product.productID}" readonly/>
            </div>
            <div class="form-group">
                <label for="Name">TÊM SP:</label>
                <input type="text" class="form-control" id="Name" name="Name" value="${product.productName}"/>
            </div>
            <div class="form-group">
                <label for="Type">LOẠI SP:</label>
                <input type="text" class="form-control" id="Type" name="Type" value="${product.productType}"/>
            </div>
            <div class="form-group">
                <label for="Price">GIÁ:</label>
                <input type="number" class="form-control" id="Price" name="Price" value="${product.productPrice}"/>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="Trend" name="Trend" ${product.isTrend() ? 'checked' : ''}/>
                <label class="form-check-label" for="Trend">Trend</label>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="Popular" name="Popular" ${product.isPopular() ? 'checked' : ''}/>
                <label class="form-check-label" for="Popular">Popular</label>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="Saleoff" name="Saleoff" ${product.isSaleoff() ? 'checked' : ''}/>
                <label class="form-check-label" for="Saleoff">Saleoff</label>
            </div>
            <div class="form-group">
                <label for="Image">Image:</label>
                <input type="file" class="form-control-file" id="Image" name="Image"/>
            </div>
            <button type="submit" class="btn btn-primary" name="action" value="update">CẬP NHẬT</button>
            <input type="reset" class="btn btn-secondary">
            <a href="ProductListServlet" class="btn btn-info">Quay lại</a>
        </form>
    </div>

    <!-- Thêm đường dẫn đến các script của Bootstrap (jQuery và Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
