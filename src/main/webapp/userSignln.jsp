<%--
  Created by IntelliJ IDEA.
  User: 鲁伟杰
  Date: 2024/5/30
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
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
    <h2>用户注册</h2>
    <form action="UserLogin?action=signLn" method="post">
        <label for="userName">用户名:</label>
        <input type="text" id="userName" name="userName" required><br><br>
        <label for="userAccount">账号:</label>
        <input type="text" id="userAccount" name="userAccount" required><br><br>
        <label for="userPassWord">密码:</label>
        <input type="password" id="userPassWord" name="userPassWord" required><br><br>
        <label for="IDNumber">身份证号:</label>
        <input type="text" id="IDNumber" name="IDNumber" required><br><br>
        <label for="realName">姓名:</label>
        <input type="text" id="realName" name="realName" required><br><br>
        <label for="telephoneNumber">电话号码:</label>
        <input type="text" id="telephoneNumber" name="telephoneNumber" required><br><br>
        <input type="submit" value="注册">
    </form>
    <a href="./userLogin.jsp">已有账号? 去登录</a>
</div>
</body>
</html>
