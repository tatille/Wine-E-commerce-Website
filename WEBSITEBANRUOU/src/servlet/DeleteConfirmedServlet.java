package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;

/**
 * Servlet implementation class DeleteConfirmedServlet
 */
@WebServlet("/deleteProduct")
public class DeleteConfirmedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("ID");

        try {
        	Connection conn = MySQLConnUtils.getMySQLConnection();
            DBConnect.deleteProductById(conn, productId);
            
            // Sau khi xóa, chuyển hướng về trang danh sách sản phẩm
            response.sendRedirect(request.getContextPath() + "/ProductListServlet");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý hoặc ghi log lỗi nếu cần
            // Chuyển hướng hoặc hiển thị thông báo lỗi cho người dùng ở đây
            response.sendRedirect(request.getContextPath() + "/ProductListServlet");
        }
    }
}
