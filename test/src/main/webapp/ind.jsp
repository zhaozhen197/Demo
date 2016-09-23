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

<div class="modal fade"  id="ShowView" tabindex="-1">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">启动画面</h4>
            </div>
            <div class="modal-body" id="showview_div">




            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="raidoOnclick()">保存</button>
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
                <h4 class="modal-title">开场提示</h4>
            </div>
            <div class="modal-body">

                <h4>图片：</h4>
                <table class= "table" table-striped>
                    <tbody id="mediaPic">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save_container_pic()">保存</button>
            </div>
        </div>
    </div>
</div>
<button class="btn btn-primary btn-lg" data-toggle="modal"
        data-target="#Openingtips" data-backdrop="static" onclick="ShowViewFirst()">启动画面</button>


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
    function ShowViewFirst() {
        $("#showview_div").append("<iframe id='showview_iframe' width='560px' height='400px' src='images/vtour/index.html'></iframe>");
    }

    //媒体库保存按钮
    function save_btn_container_pic() {
        alert("save");
        $.ajax({
            type: "post",
            url:"savemedia",
            dataType:"json",
            data:{
                container_pic_name: name
            },
            success:function (data) {
            },
            error:function () {
                alert("save error!");
            }
        });
    }
    //获得选择的图片名称
    function save_container_pic() {
        $("#mediaPic").empty()
    }

    //点击图片
    function setPicValue(name) {
        alert(name);
        $("#openview_pic").attr(({ src : 'img/pic/'+name }));
    }
    //从素材库选择图片
    function show_container_pic() {
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
                        $("#mediaPic").append("<tr class='media_container_pic_tr'>");
                        $(".media_container_pic_tr").eq(i).append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue(this.name)'name='"+ data.name[i * 3] + "' value='0' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img  name='" + data.name[i * 3] + "' src='img/pic/" + data.name[i * 3] + "' class='' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button type='button' name='"  + data.name[i * 3 + 1]  +"' value= '0' onclick='setPicValue(this.name)'  class='btn btn-default pic_button' data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 1] + "' class='' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button value='0' name='"+data.name[i * 3 + 2]+"' onclick='setPicValue(this.name);' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 2] + "'class='' height='100' width='100'>" +
                                "</buttonv></div></td></tr>"
                        )
                    }
                    $(".media_container_pic_tr").eq(temp-1).after("<tr class='media_container_pic_tr'></tr>");
                    for (var j = 3 * temp; j < data.name.length; j++) {
                        $(".media_container_pic_tr").eq(temp).append("<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue(this.name)' name='" + data.name[j] +" ' value='0' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img  class=''  src='img/pic/" + data.name[j] + "' height='100' width='100'>" +
                                "</button></div></td>");
                    }
                } else if(temp == 0) {
                    $("#mediaPic").append("<tr class='media_container_pic_tr'> </tr>");
                    for(var i = 0;i<data.name.length;i++){
                        alert( data.name[i]);
                        $(".media_container_pic_tr").append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue(this.name)' type='button' name='" + data.name[i] + "' class='btn btn-default pic_button 'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i] + "' height='100' width='100'>" +
                                "</button></div></td>")
                    }
                } else {
                    for (var i = 0; i < temp; i++) {
                        $("#mediaPic").append("<tr class='media_container_pic_tr'>");
                        $(".media_container_pic_tr").eq(i).append(
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button  onclick='setPicValue(this.name)' name='" + data.name[i * 3 + 0] + "' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 0] + "' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button onclick='setPicValue(this.name)' name='" + data.name[i * 3 + 1] + "' type='button' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
                                "<img src='img/pic/" + data.name[i * 3 + 1] + "' height='100' width='100'>" +
                                "</button></div></td>" +
                                "<td><div class='btn-group' data-toggle='buttons-checkbox'>" +
                                "<button type='button' onclick='setPicValue(this.name)' name='"+ data.name[i * 3 + 2] + "' class='btn btn-default pic_button'data-toggle='buttons-radio'>" +
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
                                "<tr>"+ data.name[i * 4 + 0] + " </tr><tr><a>移除</a></tr></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 1] + "'>" +
                                "<tr><label>" + data.name[i * 4 + 1] + " </label></tr><tr><a>移除</a></tr></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 2] + "'>" +
                                "<tr><label>" + data.name[i * 4 + 2] + " </label></tr><tr><a>移除</a></tr></td>" +
                                "<td><img src='images/smallpic/" + data.name[i * 4 + 3] + "'>" +
                                "<tr><label>" + data.name[i * 4 + 3] + " </label></tr><tr><a>移除</a></tr></td></tr>"
                        )
                    }
                    $(".container_pic_tr").eq(temp-1).after("<tr class='container_pic_tr'></tr>");
                    for (var j = 4 * temp; j < data.name.length; j++) {
                        $(".container_pic_tr").eq(temp).append("<td><img src='images/smallpic/" + data.name[j] + "'>" +
                                "<tr><label>" + data.name[j] + " </label></tr><tr><a>移除</a></tr></td>");
                    }
                } else if(temp == 0) {
                    $("#tbody").append("<tr class='container_pic_tr'>");
                    for(var i = 0;i<data.name.length;i++){
                        $(".container_pic_tr").append(
                                "<td><img src='images/smallpic/" + data.name[i] + "'>" +
                                "<tr><label>" + data.name[i] + " </label></tr><tr><a>移除</a></tr></td>")
                    }
                    $(".container_pic_tr:last-child").after("</tr>")
                } else {
                    for (var i = 0; i < temp; i++) {
                        $("#tbody").append("<tr class='container_pic_tr'>");
                        $(".container_pic_tr").eq(i).append(
                                "<td><div style='width:50px; height:50px;' class='col-md-6'><img  src='images/smallpic/" + data.name[i * 4 + 0] + "'></div>" +
                                "<div class='col-md-6'><input value='" + data.name[i * 4 + 0] + "' type='text'/><a onclick='' href='#'>移除</a></div>  </td>" +
                                "<td><div style='width:50px; height:50px;' class='col-md-6'><img  src='images/smallpic/" + data.name[i * 4 + 1] + "'></div>" +
                                "<div class='col-md-6'><input value='" + data.name[i * 4 + 1] + "' type='text'/><a href='#'>移除</a></div>  </td>" +
                                "<td><div style='width:50px; height:50px;' class='col-md-6'><img  src='images/smallpic/" + data.name[i * 4 + 2] + "'></div>" +
                                "<div class='col-md-6'><input value='" + data.name[i * 4 + 2] + "' type='text'/><a href='#'>移除</a></div>  </td>" +
                                "<td><div style='width:50px; height:50px;' class='col-md-6'><img  src='images/smallpic/" + data.name[i * 4 + 3] + "'></div>" +
                                "<div class='col-md-6'><input value='" + data.name[i * 4 + 3] + "' type='text'/><a href='#'>移除</a></div>  </td></tr>"
                        )
                    }
                }
            },
            error: function () {
                alert("error");
            }
        });
    })

    function raidoNo_use_default() {
        $("#no_default").val("no_default");
        $("#use_default") .val("0");

    }

    function raido_use_default() {
        $("#use_default").val("use_default");
        $("#no_default").val("0");
    }
    function raidoOnclick() {

        var value;
        $(".radio_default").each(function () {
            if($(this).val() == "no_default")
            {
                value = "no_default";
            }
            if($(this).val() == "use_default") {
                value = "use_default";
            }
        })
        var text;
        text = $("#open_view_text").val();

        var pic_path ;
        pic_path = $("#openview_pic")[0].src;
        alert(pic_path);
        $.ajax({
            type: "post",
            url:"openview",
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
