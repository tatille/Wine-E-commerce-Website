<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rượu nhập - Trang chủ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<div class="container">

<header>
    <nav class="navbar">
        <div id="logo">
    <a href="/WEBSITEBANRUOU/index">
       <button class="logo-button">
                    <span>V</span>
                    <span>.</span>
                    <span>Á</span>
                    <span>N</span>
                    <span>H</span>
                </button> 
		    </a>
			</div>
        <ul class="menu">
            <li><a href="#">GIỚI THIỆU</a></li>
            <li><a href="ProductClient">BỘ SƯU TẬP</a></li>
            <li><a href="#">BLOG</a></li>
            <li><a href="#">LIÊN HỆ</a></li>
        </ul>
       <div class="search-login">
    <form method="post" action="SearchProductByNameServlet">
    <input type="text" name="txtSearch" placeholder="Bạn muốn tìm sản phẩm nào?" size="30">
    <button type="submit" name="btSearch">Tìm Kiếm</button>
</form>

</div>
            <div class="login-signup">
                <a href="Login.jsp">Đăng nhập</a>
                <a href="Signup.jsp">Đăng ký</a>
            </div>
        <li>
    <a href="CartServlet">
        <img src="photoruou/gio hang icon.png" alt="Giỏ hàng" width="20" height="20">
        Giỏ hàng
    </a>  											    
</li>        
    </nav>
</header> 
<body>
        <div id="banner">
        <div class="bubble">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			    </div>
            <img class="banner" src="photoruou/B2.jpg" alt="Banner Image">
            <a href="#" class="shopnow">Mua Ngay</a>  
            </div>  
            <div class="bubble">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			    </div>
<section class="trending">											         
<h2>Sản Phẩm Bán Chạy</h2>
   <p class="intro">Chất Lượng – Uy Tín – Thương Hiệu là kim chỉ nam là định hướng cho Website của chúng tôi. Tạo dựng niềm tin, xây dựng thương hiệu để phát triển bền vững trên con đường kinh doanh cũng như phục vụ sự hài lòng của Khách Hàng.<p>
    <div class="bubble">
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		    </div>   
        <c:forEach items="${trendlistp}" var="o">
                <div class="product">
                    <img src="${o.productImg}" alt="Product Image">
                    <p>${o.productName}<br><span>${o.productPrice}</span></p>
        <form method="post" action="AddToCartServlet">
            <input type="hidden" name="productID" value="${o.productID}">
            <input type="hidden" name="productName" value="${o.productName}">
            <input type="hidden" name="productPrice" value="${o.productPrice}">
            <button type="submit">Thêm vào giỏ hàng</button>
        </form>
                </div>
            </c:forEach>
            <hr>
        </section>
          <div class="bubble">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
	    </div>   
        <section class="popular">
            <h2>SẢN PHẨM PHỔ BIẾN</h2>
            <p class="intro"></p>
            <c:forEach items="${popularlistp}" var="p">
                <div class="product">
                    <img src="${p.productImg}" alt="các loại rượu">
                    <p>${p.productName}<br><span>${p.productPrice}</span></p>
                            <form method="post" action="AddToCartServlet">
            <input type="hidden" name="productID" value="${p.productID}">
            <input type="hidden" name="productName" value="${p.productName}">
            <input type="hidden" name="productPrice" value="${p.productPrice}">
            <button type="submit">Thêm vào giỏ hàng</button>
        </form>
                </div>
            </c:forEach>
            <hr>
		    <div class="bubble">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		    </div>   
        <section class="saleoff">
    <h2>SẢN PHẨM GIẢM GIÁ</h2>
    <c:forEach items="${saleofflistp}" var="s">
    <div class="product">
        <img src="${s.productImg}" alt="Ảnh sản phẩm">
        <p>${s.productName}<br><span>${s.productPrice}</span></p>
        <form method="post" action="AddToCartServlet">
            <input type="hidden" name="productID" value="${s.productID}"> <!-- Sửa o.productID thành s.productID -->
            <input type="hidden" name="productName" value="${s.productName}"> <!-- Sửa o.productName thành s.productName -->
            <input type="hidden" name="productPrice" value="${s.productPrice}"> <!-- Sửa o.productPrice thành s.productPrice -->
            <button type="submit">Thêm vào giỏ hàng</button>
        </form>
    </div>
</c:forEach>
    <hr>   
</section>
     </section>
     <div class="bubble">
		<span></span>
		<span></span>
		<span></span>
		<span></span>
		<span></span>
	    </div>
        <section class="blog">
            <h2>Chúng Tôi Cam Đoan!</h2>
            <p>Chúng tôi cam kết tất cả các sản phẩm được phân phối tại Website đều là hàng đã qua kiểm tra, có nguồn gốc xuất xứ đầy đủ. Giao hàng nhanh chóng khách hàng kiểm tra hàng chuẩn mới phải thanh toán.
            Tất cả sản phẩm điều là hàng chính hãng 100% nếu phát hiện hàng giả đền tiền gấp 100 lần!</p>
            <section class="blogs">
                <article>
                    <p><span></span></article>
                <!-- Thêm các bài viết khác -->
            </section>
        </section>
   <footer>
        <div id="extend-f">
            <nav class="footnavl">
                <h3>DỊCH VỤ KHÁCH HÀNG</h3>
                <ul>
                    <li><a href="#">Liên hệ</a></li>
                    <li><a href="#">Hoàn trả</a></li>
                    <li><a href="#">Sơ đồ trang web</a></li>
                    <li><a href="#">Phiếu quà tặng</a></li>
                </ul>
            </nav>
            <nav class="footnav2">
           
                <h3>THÔNG TIN</h3>
                <ul>
                    <li><a href="#">Về chúng tôi</a></li>
                    <li><a href="#">Thông tin vận chuyển</a></li>
                    <li><a href="#">Chính sách bảo mật</a></li>
                </ul>
                 <div class="bubble">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		    </div>
            </nav>
             
            <nav class="footnav3">
                <h3>LIÊN KẾT MẠNG XÃ HỘI</h3>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Google+</a></li>
                    <li><a href="#">Twitter</a></li>
                </ul>
            </nav>
        </div>
        <div class="bubble">
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		    </div>
        <div id="root-f">
            <h4>2023&copy; Thiết kế bởi Ánh</h4>
        </div>
    </footer>

</div>
</html>
