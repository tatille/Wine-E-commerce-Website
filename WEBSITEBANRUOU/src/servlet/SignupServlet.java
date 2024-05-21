package servlet;

import java.io.IOException;
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
@WebServlet(name = "SignupServlet", urlPatterns = { "/SignupServlet" })
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null; // Kết nối SQL
        try {
            conn = MySQLConnUtils.getMySQLConnection();
            // Xử lý tham số từ form
            String username = request.getParameter("username");
            String gender = request.getParameter("gender");
            String password = request.getParameter("password");
            UserAccount usr = new UserAccount(username, gender, password); // Tạo đối tượng user
            // Thêm đối tượng vào CSDL
            DBConnect.insertUserAccount(conn, usr);
            request.setAttribute("username", username);
            request.getRequestDispatcher("/Signup.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
