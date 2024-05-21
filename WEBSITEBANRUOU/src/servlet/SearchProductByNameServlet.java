package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;
@WebServlet("/SearchProductByNameServlet")
public class SearchProductByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Nhận tên sản phẩm từ request
        String productName = request.getParameter("txtSearch"); // Sử dụng tên của input trong form tìm kiếm
        
        // Gọi phương thức trong lớp DBConnect để tìm kiếm sản phẩm theo tên
        List<Product> list = new ArrayList<Product>();
        try {
        	Connection conn = MySQLConnUtils.getMySQLConnection();
        	list = new DBConnect().findProductByName(productName);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        // Đặt danh sách sản phẩm tìm được vào attribute của request để hiển thị trên trang JSP
        request.setAttribute("searchedProducts", list);
        
        // Chuyển hướng người dùng đến trang kết quả tìm kiếm
        RequestDispatcher dispatcher = request.getRequestDispatcher("search-result.jsp"); // Đặt tên trang hiển thị kết quả tìm kiếm của bạn ở đây
        dispatcher.forward(request, response);
    }
}
