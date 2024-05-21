<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Giao diện trang chi tiết sản phẩm -->
...
<form action="AddToCartServlet" method="post">
    <input type="hidden" name="productId" value="${product.productId}">
    <input type="submit" value="Thêm vào giỏ hàng">
</form>
...
