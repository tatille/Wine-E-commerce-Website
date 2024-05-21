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
@WebServlet("/newProductServlet")
public class newProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "Images";
 
    public newProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        Connection conn = null;
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConnUtils.getMySQLConnection();

            String id = request.getParameter("ID");
            String name = request.getParameter("Name");
            String type = request.getParameter("Type"); 
            int price = Integer.parseInt(request.getParameter("Price"));
            boolean isTrend = Boolean.parseBoolean(request.getParameter("trend"));
            boolean isPopular = Boolean.parseBoolean(request.getParameter("popular"));
            boolean isSaleoff = Boolean.parseBoolean(request.getParameter("saleoff"));        
            String image = ""; 
            Part part = request.getPart("Image");
            String fileName = extractFileName(part);
            fileName = new File(fileName).getName();
 
            String path1 = request.getContextPath();
            System.out.println(path1);
            part.write("D:/java2018/WEBSITEBANRUOU/WebContent/photoruou/" + fileName);
            image = "photoruou/" + fileName; 
            Product product = new Product(id, name, type, price, image, isTrend, isPopular, isSaleoff);
            
            // Thêm đối tượng vào CSDL sử dụng phương thức từ lớp DBConnect
            DBConnect.insertProduct(conn, product); 
            request.getRequestDispatcher("/newProduct.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        } finally {
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        doGet(request, response);
    }

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
