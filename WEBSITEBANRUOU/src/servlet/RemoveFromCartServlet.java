package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Product;

/**
 * Servlet implementation class đs
 */
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận ID sản phẩm cần xóa từ request
        String productId = request.getParameter("productID");

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        // Xóa sản phẩm khỏi giỏ hàng dựa trên ID
        if (cart != null) {
            Iterator<Product> iterator = cart.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
                if (product.getProductID().equals(productId)) {
                    iterator.remove();
                    break;
                }
            }
        }

        // Cập nhật lại giỏ hàng trong session sau khi xóa
        session.setAttribute("cart", cart);

        // Redirect hoặc chuyển hướng trở lại trang giỏ hàng sau khi xóa
        response.sendRedirect("cart.jsp"); // Thay đổi "cart.jsp" bằng trang giỏ hàng của bạn
    }
}
