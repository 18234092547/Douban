<%--
  Created by IntelliJ IDEA.
  User: csy
  Date: 2017/11/23
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>

<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>国家列表</title>
</head>
<body>
<table>
    <tr>
        <th>国家</th>
        <th>数量</th>
    </tr>
    <c:forEach items="${doubancList}" var="doubanc">
        <tr>
            <td>${doubanc.country}</td>
            <td>${doubanc.nums}</td>
        </tr>

    </c:forEach>

</table>

</body>
</html>
