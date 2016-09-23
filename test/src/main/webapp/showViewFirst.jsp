<%--
  Created by IntelliJ IDEA.
  User: ZZ
  Date: 2016/9/23
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<td>
    <button class="btn btn-default" id="showViewFirst" data-toggle="modal"
            data-target="#ShowView" data-backdrop="static" >浏览</button>
</td>


<div class="modal fade" id="ShowView" tabindex="-1" style="width: 500px;height:500px ">
    <iframe src="images/vtour/index.html"></iframe>
    <button class="btn btn-default" data-dismiss="modal">关闭</button>
</div>

</body>
</html>
