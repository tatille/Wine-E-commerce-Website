package servlet;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Model.*;

/**
 * Servlet implementation class deleteProductServlet
 */
@WebServlet("/confirmDelete")
public class ConfirmDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("ID");

        try {
            Connection conn = DBConnect.getConnection();
            Product productToDelete = DBConnect.findProductById(conn, productId);

            if (productToDelete != null) {
                // Gửi thông tin sản phẩm cần xóa đến trang xác nhận xóa
                request.setAttribute("productToDelete", productToDelete);
                request.getRequestDispatcher("/confirmDelete.jsp").forward(request, response);
            } else {
                // Xử lý khi không tìm thấy sản phẩm cần xóa
                response.sendRedirect(request.getContextPath() + "/productList.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý hoặc ghi log lỗi nếu cần
            // Chuyển hướng hoặc hiển thị thông báo lỗi cho người dùng 
            response.sendRedirect(request.getContextPath() + "/productList.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("ID");

        try {
            Connection conn = DBConnect.getConnection();
            Product productToDelete = DBConnect.findProductById(conn, productId);

            if (productToDelete != null) {
                // Gửi thông tin sản phẩm cần xóa đến trang xác nhận xóa
                request.setAttribute("productToDelete", productToDelete);
                request.getRequestDispatcher("/confirmDelete.jsp").forward(request, response);
            } else {
                // Xử lý khi không tìm thấy sản phẩm cần xóa
                response.sendRedirect(request.getContextPath() + "/productList.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý hoặc ghi log lỗi nếu cần
            // Chuyển hướng hoặc hiển thị thông báo lỗi
            response.sendRedirect(request.getContextPath() + "/productList.jsp");
        }
    }
}
