<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .container {
            margin: auto;
            max-width: 400px;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>管理员登录</h2>
    <form action="AdminServlet?action=loGin" method="post">
        <label for="ID">ID:</label>
        <input type="text" id="ID" name="ID" required><br><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="登录">
        <a href="./userLogin.jsp">切换为用户登录</a>
        <a href="./AdminSignln.jsp">还没有账号? 注册</a>
    </form>
    <% String loginError = (String) session.getAttribute("AdminLoginError"); %>
    <% if (loginError != null) { %>
    <p style="color: red;"><%= loginError %></p>
    <% } %>
</div>
</body>
</html>
