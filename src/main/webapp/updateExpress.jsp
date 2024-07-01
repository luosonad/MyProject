<%--
  Created by IntelliJ IDEA.
  User: 鲁伟杰
  Date: 2024/6/16
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <h2>修改内容</h2>
    <form action="ExpressServlet?action=update&person=${person}" method="post">
        <input type="hidden" name="number" value="${express.number}">
        <table>
            <tr>
                <td>商品名称</td>
                <td><input type="text" name="name" value="${express.name}"></td>
            </tr>
            <tr>
                <td>价格</td>
                <td><input type="text" name="pieces" value="${express.pieces}"></td>
            </tr>
            <tr>
                <td>发送人姓名</td>
                <td><input type="text" name="senderName" value="${express.senderName}"></td>
            </tr>
            <tr>
                <td>发送人电话</td>
                <td><input type="text" name="senderTele" value="${express.senderTele}"></td>
            </tr>
            <tr>
                <td>收件人电话</td>
                <td><input type="text" name="reciTele" value="${express.reciTele}"></td>
            </tr>
            <tr>
                <td>收件人姓名</td>
                <td><input type="text" name="reciName" value="${express.reciName}"></td>
            </tr>
            <tr>
                <td>收件人地址</td>
                <td><input type="text" name="reciArea" value="${express.reciArea}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交">
                    <button type="button">取消</button>
                </td>
            </tr>
        </table>
    </form>
</div>
