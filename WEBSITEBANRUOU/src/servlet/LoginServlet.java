package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = MySQLConnUtils.getMySQLConnection();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserAccount usr = new UserAccount(username, password);

            UserAccount u = DBConnect.findUser(conn, usr.getUserName(), usr.getPassword());
            if (u != null) {
                UserAccount user = new UserAccount(u);
                request.setAttribute("loginSuccess", true); // Đặt thuộc tính thông báo đăng nhập thành công
                request.setAttribute("username", "Chào bạn: " + user.getUserName());
                request.getRequestDispatcher("/index").forward(request, response); // Điều chỉnh đường dẫn đến trang index
            } else {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Thông báo</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Không Tìm Thấy Thông Tin Đăng Nhập! <a href='Login.jsp'>Nhập lại</a> hoặc <a href='Signup.jsp'>Đăng ký</a></h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
