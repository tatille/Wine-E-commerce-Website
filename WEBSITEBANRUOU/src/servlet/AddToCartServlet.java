package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Product;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
        // Lấy thông tin sản phẩm từ request
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        
        // Tạo đối tượng sản phẩm từ thông tin lấy được
        Product product = new Product(productID, productName, null, productPrice, null, false, false, false);

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        
        // Kiểm tra nếu giỏ hàng chưa được khởi tạo, tạo mới
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        
        // Thêm sản phẩm vào giỏ hàng
        cart.add(product);
        
        // Cập nhật giỏ hàng trong session
        session.setAttribute("cart", cart);
        
        // Chuyển hướng người dùng đến trang giỏ hàng hoặc trang thông tin sản phẩm
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}
