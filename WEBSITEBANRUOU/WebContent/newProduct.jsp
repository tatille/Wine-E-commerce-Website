<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Product</title>
    <!-- CSS Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
            background-color: #f4f4f4;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }
        input[type="text"],
        input[type="file"],
        input[type="checkbox"] {
            width: calc(100% - 12px);
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> THÊM SẢN PHẨM VÀO TRANG WEB CỦA BẠN! </h1>
        <form method="POST" action="newProductServlet" enctype="multipart/form-data">
            <div class="form-group">
                <label for="ID">MÃ SP:</label>
                <input type="text" class="form-control" name="ID" id="ID"/>
            </div>
            <div class="form-group">
                <label for="Name">TÊN SP:</label>
                <input type="text" class="form-control" name="Name" id="Name"/>
            </div>
            <div class="form-group">
                <label for="Type">LOẠI SP:</label>
                <input type="text" class="form-control" name="Type" id="Type"/>
            </div>
            <div class="form-group">
                <label for="Price">GIÁ:</label>
                <input type="text" class="form-control" name="Price" id="Price"/>
            </div>
            <div class="form-group">
                <label for="Image">Hình Ảnh:</label>
                <input type="file" class="form-control-file" name="Image" id="Image"/>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" name="trend" id="trend"/>
                <label class="form-check-label" for="trend">Trend</label>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" name="popular" id="popular"/>
                <label class="form-check-label" for="popular">Popular</label>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" name="saleoff" id="saleoff"/>
                <label class="form-check-label" for="saleoff">Saleoff</label>
            </div>
            <button type="submit" class="btn btn-primary">LƯU</button>
            <input type="reset" class="btn btn-secondary">
            <a href="ProductListServlet" class="btn btn-info">Quay lại</a>
        </form>
    </div>
    <!-- JavaScript Bootstrap -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
