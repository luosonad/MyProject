<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Express List</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        /* Header styles */
        .header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Container styles */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        /* Button styles */
        .add-button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            margin-bottom: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .add-button:hover {
            background-color: #0056b3;
        }

        /* Popup styles */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            max-width: 600px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        .popup table {
            border-collapse: collapse;
            width: 100%;
        }
        .popup th, .popup td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .popup input[type="text"], .popup input[type="submit"], .popup button {
            width: calc(100% - 16px);
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .popup input[type="submit"], .popup button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 3px;
        }
        .popup input[type="submit"]:hover, .popup button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="header">
    Express List
    <button onclick="showSettingsPopup()">设置</button>
</div>

<div class="container">
    <!-- Popup container for settings -->
    <div id="settingsPopup" class="popup">
        <h2>设置</h2>
        <button onclick="window.location.href='./userLogin.jsp'" >退出</button>
        <button onclick="logout()">注销</button>
    </div>


    <!-- Popup container for adding new content -->
    <div id="addPopup" class="popup">
        <h2>添加新内容</h2>
        <form action="ExpressServlet?action=add&person=${person}" method="post">
            <table>
                <tr>
                    <td>订单编号</td>
                    <td><input type="text" name="number" required></td>
                </tr>
                <tr>
                    <td>商品名称</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td><input type="text" name="pieces" required></td>
                </tr>
                <tr>
                    <td>发送人姓名</td>
                    <td><input type="text" name="senderName" required></td>
                </tr>
                <tr>
                    <td>发送人电话</td>
                    <td><input type="text" name="senderTele" required></td>
                </tr>
                <c:choose>
                    <c:when test="${person eq 'admin'}">
                        <tr>
                            <td>收件人账号</td>
                            <td><input type="text" name="reciAcc" required></td>
                        </tr>
                    </c:when>
                </c:choose>
                <tr>
                    <td>收件人电话</td>
                    <td><input type="text" name="reciTele" required></td>
                </tr>
                <tr>
                    <td>收件人姓名</td>
                    <td><input type="text" name="reciName" required></td>
                </tr>
                <tr>
                    <td>收件人地址</td>
                    <td><input type="text" name="reciArea" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
                        <button type="button" onclick="hideAddPopup()" class="add-button">取消</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <!-- Existing table for displaying data -->
    <table border="1" cellspacing="0" width="100%" style="margin-top: 20px;">
        <tr>
            <th>订单编号</th>
            <th>商品名称</th>
            <th>数量</th>
            <th>发送人姓名</th>
            <th>发送人电话</th>
            <th>收件人账号</th>
            <th>收件人姓名</th>
            <th>收件人手机号</th>
            <th>收件人地址</th>
            <th>操作</th>
        </tr>
        <jsp:useBean id="expressList" scope="request" type="java.util.List"/>
        <c:forEach items="${expressList}" var="express" varStatus="status">
            <tr align="center">
                <td>${express.number}</td>
                <td>${express.name}</td>
                <td>${express.pieces}</td>
                <td>${express.senderName}</td>
                <td>${express.senderTele}</td>
                <td>${express.reciAcc}</td>
                <td>${express.reciName}</td>
                <td>${express.reciTele}</td>
                <td>${express.reciArea}</td>
                <td><a href="/Express/ExpressServlet?action=showUpdate&number=${express.number}&person=${person}">修改</a> <a href="/Express/ExpressServlet?action=delete&number=${express.number}&person=${person}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div onclick="showAddPopup()"><button>添加</button></div>
</div>

<script>
    function showAddPopup() {
        var addPopup = document.getElementById("addPopup");
        addPopup.style.display = "block";
    }

    function hideAddPopup() {
        var addPopup = document.getElementById("addPopup");
        addPopup.style.display = "none";
    }

    function showSettingsPopup() {
        var settingsPopup = document.getElementById("settingsPopup");
        settingsPopup.style.display = "block";
    }

    function hideSettingsPopup() {
        var settingsPopup = document.getElementById("settingsPopup");
        settingsPopup.style.display = "none";
    }

    function logout() {
        var isConfirmed = confirm('您确定要注销吗？');
        if (isConfirmed) {
            var person = "${person}"; // 获取当前用户角色（通过 JSP 页面传递过来的）
            if (person === "user") {
                window.location.href = '/Express/UserLogin?action=delete&person=user';
            } else if (person === "admin") {
                window.location.href = '/Express/AdminServlet?action=delete&person=admin';
            }
        }
    }

</script>
</body>
</html>
