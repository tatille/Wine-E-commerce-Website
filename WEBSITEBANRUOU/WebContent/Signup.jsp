<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 30px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        div {
            text-align: center;
            margin-top: 20px;
        }
        h4 {
            margin-bottom: 5px;
        }
        h5 {
            color: #007bff;
        }
    </style>
</head>
<body>
    <h1>ĐĂNG KÝ</h1>
    <form method="POST" action="SignupServlet">
        <table>
            <tr>
                <td>TÊN ĐĂNG NHẬP</td>
                <td><input type="text" name="username"/></td>
            </tr>
            <tr>
                <td>GIỚI TÍNH</td>
                <td><input type="text" name="gender"/></td>
            </tr>
            <tr>
                <td>MẬT KHẨU</td>
                <td><input type="password" name="password"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button>ĐĂNG KÝ</button>
                    <input type="reset">
                </td>
            </tr>
        </table>
    </form>
    <div>
        <h4>Đăng ký thành công!
        tên đăng nhập bạn là:</h4>
        <h5>${username}</h5>
        <a href="Login.jsp">Đăng nhập ngay</a>
    </div>
</body>
</html>
