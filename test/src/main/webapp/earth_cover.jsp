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
                <h4 class="modal-title">天空遮盖</h4>
            </div>
            <div class="modal-body">


                <table class= "table" table-striped>
                    <tbody>
                    <tr>
                        <td>
                            <div class="control-group">
                                <!-- Multiple Checkboxes -->
                                <label class="radio inline">
                                    <input type="radio" name="cover_use_or_not"  class="radio_default_cover" value="no_default_cover" id="no_default_cover" onclick="raidoNo_use_default_cover()" checked>不使用遮盖
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="control-group">
                                <!-- Multiple Checkboxes -->
                                <label class="radio inline">
                                    <input type="radio" name="cover_use_or_not" onclick="raido_use_default_cover()" value="0" class="radio_default_cover" id="use_default_cover" >使用系统遮盖
                                </label>
                            </div>
                        </td>
                        <td>
                            <button class="btn btn-default" data-toggle="modal"
                                    data-target="#choose" data-backdrop="static" onclick="show_container_pic_cover()">从媒体库中选择</button>
                        </td>
                        <td>
                            <img id ="openview_pic_cover" src="./img/pic/a.png" alt="" height="30"width="30" >
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>链接：</label>
                        </td>
                        <td>
                            <input type="text" class="text-left" id="open_view_text_cover">
                        </td>
                    </tr>

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="raidoOnclick_cover()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 模态框声明 -->
<div class="modal fade" id="choose" tabindex="-1">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">天空遮盖</h4>
            </div>
            <div class="modal-body">

                <h4>图片：</h4>
                <table class= "table" table-striped>
                    <tbody id="mediaPic_cover">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save_container_pic_cover()">保存</button>
            </div>
        </div>
    </div>
</div>
<button class="btn btn-primary btn-lg" data-toggle="modal"
        data-target="#Openingtips" data-backdrop="static">天空遮盖</button>


<div class="section">
    <div class="container">
        <div class="suolue" class="row" >
            <table class= "table" table-striped >
                <thead>
                <tr>
                    <th>
                        <p>
                            全景管理
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


    //获得选择的图片名称
    function save_container_pic_cover() {
        $("#mediaPic_cover").empty()
    }

    //点击图片
    function setPicValue_cover(name) {
        alert(name);
        $("#openview_pic_cover").attr(({ src : 'img/pic/'+name }));

    }
    //从素材库选择图片
    function show_container_pic_cover() {
        alert("ok");
        $.ajax({
            type:"post",
            url: "getmedia",
            dataType:"json",
            success:function (data) {
                var temp = Math.floor(data.name.length / 3);
                var temp1 = data.name.length % 3;
                alert(temp + " || " + temp1);
                if (temp1 != 0 && temp !=0 ) {
                    for (var i = 0; i < temp; i++) {
                        $("#mediaPic_cover").append("<tr class='media_container_pic_tr_cover'>");
                        $(".media_container_pic_tr_cover").eq(i).append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue_cover(this.name)'name='"+ data.name[i * 3] + "' value='0' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img  name='" + data.name[i * 3] + "' src='img/pic/" + data.name[i * 3] + "' class='' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button type='button' name='"  + data.name[i * 3 + 1]  +"' value= '0' onclick='setPicValue_cover(this.name)'  class='btn btn-default pic_button' data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 1] + "' class='' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button value='0' name='"+data.name[i * 3 + 2]+"' onclick='setPicValue_cover(this.name);' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 2] + "'class='' height='100' width='100'>" +
                                "</buttonv></div></td></tr>"
                        )
                    }
                    $(".media_container_pic_tr_cover").eq(temp-1).after("<tr class='media_container_pic_tr_cover'></tr>");
                    for (var j = 3 * temp; j < data.name.length; j++) {
                        $(".media_container_pic_tr_cover").eq(temp).append("<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue_cover(this.name)' name='" + data.name[j] +" ' value='0' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img  class=''  src='img/pic/" + data.name[j] + "' height='100' width='100'>" +
                                "</button></div></td>");
                    }
                } else if(temp == 0) {
                    $("#mediaPic_cover").append("<tr class='media_container_pic_tr_cover'> </tr>");
                    for(var i = 0;i<data.name.length;i++){
                        $(".media_container_pic_tr_cover").append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue_cover(this.name)' type='button' name='" + data.name[i] + "' class='btn btn-default pic_button 'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i] + "' height='100' width='100'>" +
                                "</button></div></td>")
                    }
                } else {
                    for (var i = 0; i < temp; i++) {
                        $("#mediaPic_cover").append("<tr class='media_container_pic_tr'>");
                        $(".media_container_pic_tr_cover").eq(i).append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue_cover(this.name)' name='" + data.name[i * 3 + 0] + "' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 0] + "' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button onclick='setPicValue_cover(this.name)' name='" + data.name[i * 3 + 1] + "' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 1] + "' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button type='button' onclick='setPicValue_cover(this.name)' name='"+ data.name[i * 3 + 2] + "' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 2] + "' height='100' width='100'>" +
                                "</button></div></td>"
                        )
                    }
                }
            },
            error:function () {
                alert("error");
            }
        })

    }

    //当页面加载完成时，显示图片
    $(function () {

        $.ajax({
            type: "post",
            url: "piccontainer",
            dataType: "json",
            success: function (data) {
                var temp = Math.floor(data.name.length / 4);
                var temp1 = data.name.length % 4;
                if (temp1 != 0 && temp !=0 ) {
                    for (var i = 0; i < temp; i++) {
                        $("#tbody").append("<tr class='container_pic_tr'>");
                        $(".container_pic_tr").eq(i).append(
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 0] + "'>" +
                                ""+ data.name[i * 4 + 0] + " </td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 1] + "'>" +
                                "<label>" + data.name[i * 4 + 1] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 2] + "'>" +
                                "<label>" + data.name[i * 4 + 2] + " </label></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 3] + "'>" +
                                "<label>" + data.name[i * 4 + 3] + " </label></td></tr>"
                        )
                    }
                    $(".container_pic_tr").eq(temp-1).after("<tr class='container_pic_tr'></tr>");
                    for (var j = 4 * temp; j < data.name.length; j++) {
                        $(".container_pic_tr").eq(temp).append("<td><img src='images/smallpic/" + data.name[j] + "'>" +
                                "<label>" + data.name[j] + " </label></td>");
                    }

                } else if(temp == 0) {
                    $("#tbody").append("<tr class='container_pic_tr'>");
                    for(var i = 0;i<data.name.length;i++){
                        $(".container_pic_tr").append(
                                "<td><img src='images/smallpic/" + data.name[i] + "'>" +
                                "<label>" + data.name[i] + " </label></td>")
                    }
                    $(".container_pic_tr:last-child").after("</tr>")
                } else {
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
                                "<label>" + data.name[i * 4 + 3] + " </label></td></tr>"
                        )
                    }
                }
            },
            error: function () {
                alert("error");
            }
        });
    })

    function raidoNo_use_default_cover() {
        $("#use_default_cover").val("0");
        $("#no_default_cover").val("no_default_cover");

    }

    function raido_use_default_cover() {
        $("#no_default_cover").val("0");
        $("#use_default_cover").val("use_default_cover");
    }
    function raidoOnclick_cover() {

        var value;
        $(".radio_default_cover").each(function () {
            if($(this).val() == "no_default_cover")
            {
                value = "no_default_cover";
            }
            if ($(this).val() == "use_default_cover"){
                value = "use_default_cover";
            }
        })
        var text;
        text = $("#open_view_text_cover").val();

        var pic_path ;
        pic_path = $("#openview_pic_cover")[0].src;
        alert(pic_path);
        $.ajax({
            type: "post",
            url:"earthcover",
            datatype:"json",
            data:{
                defaultView:value,
                text:text,
                path:pic_path
            },
            success:function (data) {
                alert("success");
            },
            error:function () {
                alert("error");
            }

        });

    }

</script>
</body>
</html>
