package servlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;

@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public IndexServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DBConnect db = new DBConnect();
        List<Product> trendlist = new ArrayList<Product>();
        List<Product> popularlist = new ArrayList<Product>();
        List<Product> saleofflist = new ArrayList<Product>(); // Thêm danh sách sản phẩm giảm giá

        try {
            trendlist = db.selectTrendProduct();
            popularlist = db.selectPopularProduct();
            saleofflist = db.selectSaleoffProduct(); // Lấy danh sách sản phẩm giảm giá
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("trendlistp", trendlist);
        request.setAttribute("popularlistp", popularlist);
        request.setAttribute("saleofflistp", saleofflist); // Đặt danh sách sản phẩm giảm giá vào request

        request.getRequestDispatcher("Index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Auto-generated method stub
        doGet(request, response);
    }
}
