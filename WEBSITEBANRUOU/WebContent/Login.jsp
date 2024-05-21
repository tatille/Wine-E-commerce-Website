<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        center {
          
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            width: 100%;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
        }
        td {
            padding: 8px;
        }
        input[type="text"],
        input[type="password"],
        button,
        input[type="reset"] {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        input[type="reset"] {
            background-color: #dc3545;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <center>
        <div> <h1>ĐĂNG NHẬP</h1></div>
       
        <form method="POST" action="LoginServlet">
            <table>
                <tr>
                    <td>Tên đăng nhập</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Mật khẩu</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button>Đăng nhập</button>
                        <input type="reset" value="Nhập lại">
                        <a href="/WEBSITEBANRUOU/index">Quay lại</a>
                    </td>
                </tr>
            </table>
        </form>
    </center>
    
    <!-- Thông báo đăng nhập thành công -->
    <div style="text-align: center; margin-top: 20px;">
        <% if(request.getAttribute("loginSuccess") != null && (boolean) request.getAttribute("loginSuccess")) { %>
            <p style="color: green;">Đăng nhập thành công!</p>
        <% } %>
    </div>
</body>
</html>
