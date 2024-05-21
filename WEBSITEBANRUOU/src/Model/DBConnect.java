package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class DBConnect {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitebanruou", "root", "");
        return con;
    }

    public static UserAccount findUser(Connection conn, String userName, String password) throws SQLException {
        String sql = "SELECT a.UserName, a.Password, a.Gender FROM User_Account a WHERE a.UserName = ? AND a.Password = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String gender = rs.getString("Gender");
            UserAccount user = new UserAccount();
            user.setUserName(userName);
            user.setPassword(password);
            user.setGender(gender);
            return user;
        }
        return null;
    }

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {
		String sql = "SELECT a.UserName, a.Password, a.Gender FROM User_Account a WHERE a.UserName = ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String password = rs.getString("Password");
			String gender = rs.getString("Gender");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setGender(gender);
			return user;
		}
		return null;
	}

	public static void insertUserAccount(Connection conn, UserAccount user) throws SQLException {
		String sql = "INSERT INTO User_Account(UserName, Gender, Password) VALUES (?, ?, ?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, user.getUserName());
		pstm.setString(2, user.getGender());
		pstm.setString(3, user.getPassword());
		pstm.executeUpdate();
	}

	public static int insertProduct(Connection conn, Product productt) throws SQLException, ClassNotFoundException {
	    int row = 0;
	    PreparedStatement ps = null;
	    try {
	        ps = conn.prepareStatement("INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
	        ps.setString(1, productt.getProductID());
	        ps.setString(2, productt.getProductName());
	        ps.setString(3, productt.getProductType());
	        ps.setDouble(4, productt.getProductPrice());
	        ps.setString(5, productt.getProductImg());
	        ps.setBoolean(6, productt.isTrend());
	        ps.setBoolean(7, productt.isPopular());
	        ps.setBoolean(8, productt.isSaleoff());
	        row = ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null)
	                ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return row;
	}

  
    // Other methods (selectTrendProduct, selectPopularProduct, selectAllProduct, findProductByName, findProduct, updateProduct)
    public List<Product> selectTrendProduct() throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try {
            cnn = this.getConnection();
            ps = cnn.prepareStatement("SELECT * FROM Product WHERE Trend = true");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("ID"),
                    rs.getString("Name"),
                    rs.getString("Type"),
                    rs.getDouble("Price"),
                    rs.getString("Image"),
                    rs.getBoolean("Trend"),
                    rs.getBoolean("Popular"),
                    rs.getBoolean("Saleoff")
                );
                productList.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cnn != null)
                    cnn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    // Tương tự, bạn cũng có thể triển khai các phương thức selectPopularProduct, selectAllProduct, findProductByName, findProduct và updateProduct ở đây
    public List<Product> selectPopularProduct() throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try {
            cnn = this.getConnection();
            ps = cnn.prepareStatement("SELECT * FROM Product WHERE Popular = true");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("ID"),
                    rs.getString("Name"),
                    rs.getString("Type"),
                    rs.getDouble("Price"),
                    rs.getString("Image"),
                    rs.getBoolean("Trend"),
                    rs.getBoolean("Popular"),
                    rs.getBoolean("Saleoff")
                );
                productList.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cnn != null)
                    cnn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }
    public List<Product> selectSaleoffProduct() throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try {
            cnn = this.getConnection();
            ps = cnn.prepareStatement("SELECT * FROM Product WHERE Saleoff = true");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("ID"),
                    rs.getString("Name"),
                    rs.getString("Type"),
                    rs.getDouble("Price"),
                    rs.getString("Image"),
                    rs.getBoolean("Trend"),
                    rs.getBoolean("Popular"),
                    rs.getBoolean("Saleoff")
                );
                productList.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cnn != null)
                    cnn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    // Các phương thức selectAllProduct, findProductByName, findProduct và updateProduct có thể triển khai tương tự như trên.


    public static List<Product> selectAllProduct(Connection conn) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try {
            ps = conn.prepareStatement("SELECT * FROM Product");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("ID"),
                    rs.getString("Name"),
                    rs.getString("Type"),
                    rs.getDouble("Price"),
                    rs.getString("Image"),
                    rs.getBoolean("Trend"),
                    rs.getBoolean("Popular"),
                    rs.getBoolean("Saleoff")
                );
                productList.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }
//them xóa sửa 

    public List<Product> findProductByName(String name) throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();
        try {
            cnn = this.getConnection();
            ps = cnn.prepareStatement("SELECT * FROM Product WHERE Name LIKE ?");
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("ID"),
                    rs.getString("Name"),
                    rs.getString("Type"),
                    rs.getDouble("Price"),
                    rs.getString("Image"),
                    rs.getBoolean("Trend"),
                    rs.getBoolean("Popular"),
                    rs.getBoolean("Saleoff")
                );
                productList.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (ps != null)
                    ps.close();
                if (cnn != null)
                    cnn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }
    public static void updateProduct(Connection conn, Product product) throws SQLException {
        String query = "UPDATE Product SET Name=?, Type=?, Price=?, Image=?, Trend=?, Popular=?, SaleOff=? WHERE ID=?";
        try (PreparedStatement pstm = conn.prepareStatement(query)) {
            pstm.setString(1, product.getProductName());
            pstm.setString(2, product.getProductType());
            pstm.setDouble(3, product.getProductPrice());
            pstm.setString(4, product.getProductImg());
            pstm.setBoolean(5, product.isTrend());
            pstm.setBoolean(6, product.isPopular());
            pstm.setBoolean(7, product.isSaleoff());
            pstm.setString(8, product.getProductID());
            pstm.executeUpdate();
        }
    }

    public static void deleteProductById (Connection conn, String productId) throws SQLException {
    		String sql="delete from Product where ID=?";
    		try (PreparedStatement pstm= conn.prepareStatement (sql)){
    		pstm.setString(1, productId);
    		pstm.executeUpdate();
    		}
    }

    public static Product findProductById(Connection conn, String productId) throws SQLException {
        String query = "SELECT * FROM Product WHERE ID=?";
        try (PreparedStatement pstm = conn.prepareStatement(query)) {
            pstm.setString(1, productId);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product(
                        rs.getString("ID"),
                        rs.getString("Name"),
                        rs.getString("Type"),
                        rs.getDouble("Price"),
                        rs.getString("Image"),
                        rs.getBoolean("Trend"), 
                        rs.getBoolean("Popular"),
                        rs.getBoolean("SaleOff")
                    );
                    return product;
                }
            }
        }
        return null;
    }
    //phân loại sản phẩm

}