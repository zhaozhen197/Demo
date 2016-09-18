<%--
  Created by IntelliJ IDEA.
  User: ZZ
  Date: 2016/9/15
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<c:forEach var="img" items="${imageBeanList}" varStatus="status">
    <img src="./smallpic/${img.name}"/>
    <h4>${img.path}</h4>
</c:forEach>
</body>
</html>
