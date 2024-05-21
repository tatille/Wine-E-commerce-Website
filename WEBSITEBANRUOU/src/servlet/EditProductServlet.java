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

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 10,
    maxFileSize = 1024 * 1024 * 50,
    maxRequestSize = 1024 * 1024 * 100
)
@WebServlet("/editProductServlet")
public class EditProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("ID");
        try {
            Connection conn = MySQLConnUtils.getMySQLConnection(); // Lấy kết nối từ MySQLConnUtils 
            Product product = DBConnect.findProductById(conn, productId); // Gọi phương thức findProductById đ
            conn.close(); // Đóng kết nối 

            request.setAttribute("product", product);
            request.getRequestDispatcher("/EditProduct.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý lỗi 
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");

        String productId = request.getParameter("ID");
        String productName = request.getParameter("Name");
        String productType = request.getParameter("Type");
        double productPrice = Double.parseDouble(request.getParameter("Price"));
        String productImage = "Image";

        Part part = request.getPart("Image");
        String fileName = extractFileName(part);
        fileName = new File(fileName).getName();
        part.write("D:/java2018/WEBSITEBANRUOU/WebContent/photoruou/" + fileName);
        productImage = "photoruou/" + fileName;

        boolean isTrend = Boolean.parseBoolean(request.getParameter("Trend"));
        boolean isPopular = Boolean.parseBoolean(request.getParameter("Popular"));
        boolean isSaleoff = Boolean.parseBoolean(request.getParameter("Saleoff"));

        Product product = new Product(productId, productName, productType, productPrice, productImage, isTrend, isPopular, isSaleoff);

        try {
            Connection conn = MySQLConnUtils.getMySQLConnection(); // Lấy kết nối từ MySQLConnUtils
            DBConnect.updateProduct(conn, product); // Gọi phương thức updateProduct 
            conn.close(); // Đóng kết nối 

            response.sendRedirect(request.getContextPath() + "/ProductListServlet"); // Chuyển hướng về trang danh sách sản phẩm
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý lỗi 
        }
    }
    // Hàm hỗ trợ để trích xuất tên file từ Part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
}
