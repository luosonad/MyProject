<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员注册</title>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            background-image: url(images/登录背景.jpg);
            background-size: cover;
        }
        .centered-form {
            width: 600px;
            margin: 50px auto;
        }
        .mainPart {
            background-color: rgba(255, 255, 255, 0.4);
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            position: relative; /* 添加相对定位 */
        }
        .mainPart h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50; /* 绿色 */
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
            display: block; /* 让按钮居中 */
            margin: 0 auto; /* 让按钮居中 */
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: blue; /* 超链接颜色 */
        }
        .error-message {
            color: red;
            position: absolute;
            left: 0;
            bottom: 50px; /* 与注册按钮等高 */
            width: 100%; /* 让错误信息占满整个宽度 */
            text-align: center; /* 文字居中 */
        }
    </style>
</head>
<body>
<div class="centered-form">
    <div class="mainPart">
        <h2>管理员注册</h2>
        <form method="post" action="AdminServlet?action=signLn">
            <div id="adminFields">
                <div class="form-group">
                    <label for="ID">管理员ID:</label>
                    <input type="text" id="ID" name="ID">
                </div>
                <div class="form-group">
                    <label for="password">密码:</label>
                    <input type="password" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="TelephoneNumber">电话号码:</label>
                    <input type="text" id="TelephoneNumber" name="TelephoneNumber">
                </div>
            </div>
            <div class="form-group">
                <input type="submit" value="注册">
            </div>
        </form>
        <p class="error-message">
            <% String loginError = (String) session.getAttribute("AdminSignlnError"); %>
            <% if (loginError != null) { %>
            <%= loginError %>
            <% } %>
        </p>
        <a href="./AdminLogin.jsp">已有账号? 去登录</a>
    </div>
</div>
</body>
</html>
