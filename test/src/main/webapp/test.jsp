<%--
  Created by IntelliJ IDEA.
  User: ZZ
  Date: 2016/9/20
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
        <title>开场提示</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
        </style>
    </head>
</head>
<body>
<div class="modal fade" id="Openingtips" tabindex="-1">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">启动画面</h4>
            </div>
            <div class="modal-body">


                <table class= "table" table-striped  >
                    <tbody>
                    <tr>
                        <td>
                            <div class="control-group">
                                <!-- Multiple Checkboxes -->
                                <label class="radio inline">
                                    <input type="radio" name="use_or_not" class="radio" value="off">不使用提
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="control-group">
                                <!-- Multiple Checkboxes -->
                                <label class="radio inline">
                                    <input type="radio" name="use_or_not"  value="on" class="radio" >使用默认提示
                                </label>
                            </div>
                        </td>
                        <td>
                            <a href="#" class="btn btn-primary" >从媒体库中选择</a>
                        </td>
                        <td>
                            <img src="./img/logo.png" alt="" height="30"width="30" >
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <label>文字：</label>
                        </td>
                        <td>
                            <input type="text" class="text-left" id="open_view_text">
                        </td>
                    </tr>

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" onclick="raidoOnclick()">保存</button>
            </div>
        </div>
    </div>
</div>


<button class="btn btn-primary btn-lg" data-toggle="modal"
        data-target="#Openingtips" data-backdrop="static">启动画面</button>


<div class="section">
    <div class="container">

        <div class="suolue" class="row" >

            <table class= "table" table-striped >

                <thead>
                <tr>
                    <th>
                        <p>
                            全景管理 共有X个作品

                        </p>
                    </th>
                    <th><p></p></th>
                    <th><p></p> </th>
                    <th>
                        <a href="#" ><p>从素材库中添加</p></a>

                    </th>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>

            </table>

        </div>
    </div>
</div>



<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#tbody").append("']]]]]");

        $.ajax({
            type: "post",
            url: "piccontainer",
            dataType: "json",
            success: function (data) {
                alert("ok");
                alert(data.name.length)
                var temp = data.name.length / 4;
                var temp1 = data.name.length % 4;
                if (temp1 != 0 && temp !=0 ) {

                    for (var i = 0; i < temp; i++) {
                        $("#tbody").append("<tr class='container_pic_tr'>");
                        $(".container_pic_tr").eq(i).append(
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 0] + "'>" +
                                "<label>" + data.name[i * 4 + 0] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 1] + "'>" +
                                "<label>" + data.name[i * 4 + 1] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 2] + "'>" +
                                "<label>" + data.name[i * 4 + 2] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 3] + "'>" +
                                "<label>" + data.name[i * 4 + 3] + " </label></td></th>"
                        )
                        $("#tbody :last-child").after("<tr></tr>");
                        for (var j = 4 * temp; j < data.name.length; j++) {
                            $("#tbody :last-child").append("<td><img src='images/smallpic/" + data.name[j] + "'>" +
                                    "<label>" + data.name[j] + " </label></td>");

                        }
                    }

                } else if(temp == 0) {
                    $("#tbody").append("<tr class='container_pic_tr'>");
                    for(var i = 0;i<data.name.length;i++){
                        $(".container_pic_tr").append(
                                "<td><img src='images/smallpic/" + data.name[i] + "'>" +
                                "<label>" + data.name[i] + " </label></td>")
                    }
                    $(".container_pic_tr:last-child").after("</tr>")
                }
                else {
                    for (var i = 0; i < temp; i++) {
                        $("#tbody").append("<tr class='container_pic_tr'>");
                        $(".container_pic_tr").eq(i).append(
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 0] + "'>" +
                                "<label>" + data.name[i * 4 + 0] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 1] + "'>" +
                                "<label>" + data.name[i * 4 + 1] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 2] + "'>" +
                                "<label>" + data.name[i * 4 + 2] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 3] + "'>" +
                                "<label>" + data.name[i * 4 + 3] + " </label></td></th>"
                        )
                    }
                }
            },
            error: function () {
                alert("error");
            }
        });
    })


    function raidoOnclick() {
        var value;
        $(".radio").each(function () {
            alert($(this).val());
          if(  $(this).val() == "on")
          {
              value = "on";
          } else{
              value="off"
          }
        })
        var text;
        text = $("#open_view_text").val();

        $.ajax({
            type: "post",
            url:"openview",
            datatype:"json",
            data:{
              defaultView:value,
                text:text,
            },
            success:function (data) {

            }

        });

    }

</script>
</body>
</html>
