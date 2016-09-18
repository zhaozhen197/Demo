<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.zane.Bean.Music" %>
<%@ page import="java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: ZZ
  Date: 2016/9/15
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String voiceId = "voice1";
    String musicClass = "music";
%>
<html>
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>音乐背景</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
    </style>
</head>
<body>
<%
    List<String> checkboxes = new ArrayList<String>();
    checkboxes.add("小行星开场：");
    checkboxes.add("场景选择：");
    checkboxes.add("自动巡航：");
    checkboxes.add("拍摄地点：");

    List<String> checks = new ArrayList<String>();
    checks.add("显示说一说：");
    checks.add("手机螺旋仪：");

    checks.add("VR眼镜：");
    checks.add("作者名称：");
    request.setAttribute("checkboxes",checkboxes);
    request.setAttribute("checks",checks);
%>


<!-- 功能启用-->
<div class="modal fade" id="Functionenable" tabindex="-1">

    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">

            <div class="modal-header">
                <button class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">功能启用</h4>
            </div>

            <div class="modal-body">
                <div id="legend" class="">
                    <legend class="leipiplugins-orgvalue">功能启用</legend>
                </div>

                    <table class= "table" table-striped >
                        <tbody>
                        <tr>

                            <c:forEach var="checkbox" items="${checkboxes}" varStatus="status">
                                <td>
                                    <div class="control-group">
                                        <label class="control-label leipiplugins-orgname">${checkbox}</label>
                                        <div class="controls leipiplugins-orgvalue">
                                            <label>
                                                <input type="checkbox" name="checkbox"  class="edit_checkbox" orginline="inline" /> 启用
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr>
                            <c:forEach var="checkbox" items="${checks}" varStatus="status">
                                <td>
                                    <div class="control-group">
                                        <label class="control-label leipiplugins-orgname">${checkbox}</label>
                                        <div class="controls leipiplugins-orgvalue">
                                            <label>
                                                <input type="checkbox" name="checkbox"   class="edit_checkbox" orginline="inline"> 启用
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </c:forEach>
                        </tr>

                        </tbody>

                    </table>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button  id="fun_submit_btn" onclick="fun_btn()" type="button" class="btn btn-primary" >提交</button>
                    </div>

            </div>


        </div>
    </div>
</div>

<input value="test" id="10">

<button class="btn btn-primary btn-lg" data-toggle="modal"
        data-target="#Functionenable" href="mymusic.html"data-backdrop="static">功能</button>


<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
    function fun_btn() {
        alert("k");
        alert($("#10").val("101010"));
        $(".edit_checkbox").each(function () {
            alert(this.value());
        })
    }
    $("#fun_submit_btn").click(function () {

    })


    function testSession(name) {
       $.ajax({
            type:"post",
            url:"background",
           datatype:"json",
           data:{
               name:name,
           },
           success:function () {
               
           },
           error:function () {
               
           }
       })

    }
    //    点击该按钮时，发出ajax请求
    function voiceOnclick() {
        $.ajax({
            type: "post",
            url:"voice",
            dataType:"json",
            success:function (data) {
                alert("success")
                var voice= "voice";
                for (var i = 0; i < data.name.length; i++) {
                    $("#voiceitems").append("<tr>" +
                            "<td>"+i+1+"</td>" +
                            "<td>"+data.name[i]+"</td>" +
                            "<td><audio src='./voice/voice1.mp3' class='voice' controls='controls' preload id='voice1' hidden /> <button id='a' class='btn btn-primary'  onclick='voiceaudio()'>试听/暂停</button></td>" +
                            "<td><a class='btn btn-primary'>设为背景音乐</a></td>" +
                            "</tr>");
                };
            },
            error:function () {
                alert("error");
            }
        })
    }

    function audio(id){
        var audio =document.getElementById(id);
        var audios = document.getElementsByClassName("music");
        if (audio.paused){
            for (var i =0;i<audios.length;i++) {
                if (audios[i].played) {
                    audios[i].pause();
                }
            }
            audio.play();
        }else {
            audio.pause();
        }

    }

    function musicColose(){
        alert("close");
        var audios = document.getElementsByClassName("music");
        for (var i =0;i<audios.length;i++) {
            if (audios[i].played) {
                audios[i].pause();
            }
        }
    }
    function voiceaudio() {
        var audio =document.getElementById("voice1");
        var audios = document.getElementsByClassName("voice");
        if (audio.paused){
            for (var i =0;i<audios.length;i++) {
                if (audios[i].played) {
                    audios[i].pause();
                }
            }
            audio.play();
        }else {
            audio.pause();
        }

    }

    function voiceClose() {
        $("#voiceitems").empty()
        var audios = document.getElementsByClassName("voice");
        for (var i =0;i<audios.length;i++) {
            if (audios[i].played) {
                audios[i].pause();
            }
        }
    }
</script>
</body>
</html>
