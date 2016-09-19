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
                            <input type="checkbox" name="checkbox"  class="edit_checkbox" value="0" orginline="inline" /> 启用
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
                            <input type="checkbox" name="checkbox"  value="0" class="edit_checkbox" orginline="inline"> 启用
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
                  <input  type="submit" class="btn btn-primary" onclick="fun_btn()" value="提交"/>
                </div>


        </div>


      </div>
    </div>
  </div>
<%--功能启用end--%>

<%
  List<Music> musics = new ArrayList<>();
  Music music = null;
    for(int i = 1; i<5;i++) {
      music = new Music(i ,""+i, "a();", null);
      musics.add(music);
    }
    request.setAttribute("musics",musics);
%>
  <h4>全景设置：</h4>
  <!-- 模态框声明 -->
  <div class="modal fade" id="mymusic" tabindex="-1">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
      <!-- 内容声明 -->
      <div class="modal-content">

        <div class="modal-header">
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
          <h4 class="modal-title">背景音乐</h4>
        </div>

        <div class="modal-body">
          <h4>系统音乐：</h4>
          <table class= "table" table-striped >
            <thead>
            <tr>
              <th>编号</th>
              <th>歌曲名</th>
              <th>试听</th>
              <th>设为背景音乐</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach varStatus="status" items="${musics}" var="music">
              <tr>
                <td>${music.id}</td>
                <td>${music.name}</td>
                <td>
                  <div>
                    <audio src="./img/${music.name}.mp3" class="music" controls="controls" preload id="${music.id}" hidden >

                    </audio>

                    <button id="a" class="btn btn-primary"  onclick="audio(${music.id})">试听/暂停</button>
                  </div>
                </td>
                <td>
                  <button class="btn btn-primary" onclick="testMusicSession(${music.name})"> 设为背景音乐</button>
                </td>

              </tr>

            </c:forEach>
            </tbody>
          </table>
          <h4>
            自定义上传音乐：
          </h4>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="musicColose()">关闭</button>
          <button type="button" class="btn btn-primary">保存</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 相机拍摄数据 -->
  <div class="modal fade" id="myphoto" tabindex="-1">

    <!-- 窗口声明 -->
    <div class="modal-dialog">
      <!-- 内容声明 -->
      <div class="modal-content">

        <div class="modal-header">
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
          <h4 class="modal-title">相机拍摄数据</h4>
        </div>

        <div class="modal-body">
          <div class="input-group">
            <span class="input-group-addon">相机型号：</span>
            <input name="cameraPattern" type="text" class="form-control" >
          </div>

          <div class="input-group">
            <span class="input-group-addon">镜头型号：</span>
            <input name="cameraShot" type="text" class="form-control"/>
          </div>

          <div class="input-group">
            <span class="input-group-addon">云台型号：</span>
            <input name="yunTaiType" type="text" class="form-control"/>
          </div>


          <div class="input-group">
            <span class="input-group-addon">光圈大小：</span>
            <input name="ligthRing" type="text" class="form-control"/>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" id="camera_save_btn" class="btn btn-primary" onclick="">保存</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 相机拍摄数据 -->

  <!-- 语音解说 -->
  <div class="modal fade" id="Voiceinterpretation" tabindex="-1">

    <!-- 窗口声明 -->
    <div class="modal-dialog">
      <!-- 内容声明 -->
      <div class="modal-content">

        <div class="modal-header">
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
          <h4 class="modal-title">语音解说</h4>
        </div>
        <h4>解说语音：</h4>
        <table class= "table" table-striped >
          <thead>
          <tr>
            <th>编号</th>
            <th>歌曲名</th>
            <th>试听</th>
            <th>设为背景音乐</th>
          </tr>
        </thead>
          <tbody id="voiceitems">

          </tbody>
        </table>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="voiceClose()">关闭</button>
          <button type="button" class="btn btn-primary">保存</button>
        </div>
      </div>
    </div>
  </div>


  <!-- 语音解说 -->



  <!-- 天空/地面遮盖 -->
  <div class="modal fade" id="Skygroundcover" tabindex="-1">

    <!-- 窗口声明 -->
    <div class="modal-dialog">
      <!-- 内容声明 -->
      <div class="modal-content">

        <div class="modal-header">
          <button class="close" data-dismiss="modal"><span>&times</span></button>
          <h4 class="modal-title">天空/地面遮盖</h4>
        </div>
        <div class="modal-body">
            <table>

                <tbody>
                <div class="controls leipiplugins-orgvalue">
                    <!-- Multiple Checkboxes -->
                    <label class="radio inline">
                        <input type="radio" name="one" title="单选框" value="选项1" class="leipiplugins" leipiplugins="radio" orginline="inline">
                        不使用遮罩
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="one" title="单选框" value="选项2" class="leipiplugins" leipiplugins="radio" orginline="inline" checked>
                        使用默认遮罩
                    </label>
                </div>
                </tbody>
            </table>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary">保存</button>
        </div>
      </div>
    </div>
  </div>


  <!-- 天空/地面遮盖 -->

  <!-- 开场提示-->
  <div class="modal fade" id="Openingtips" tabindex="-1">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
      <!-- 内容声明 -->
      <div class="modal-content">
        <div class="modal-header">
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
          <h4 class="modal-title">开场提示</h4>
        </div>
        <div class="modal-body">
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary">保存</button>
        </div>
      </div>
    </div>
  </div>




  <!-- 开场提示-->
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

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary">保存</button>
        </div>
      </div>
    </div>
  </div>


  <!-- 开场提示 -->

  <button class="btn btn-primary " data-toggle="modal"
          data-target="#mymusic" href="mymusic.html"data-backdrop="static">背景音乐</button>

  <button class="btn btn-primary " data-toggle="modal"
          data-target="#myphoto" data-backdrop="static">相机拍摄数据</button>
          <button type="submit" class="btn btn-primary" data-toggle="modal"
          data-target="#Voiceinterpretation" data-backdrop="static" onclick="voiceOnclick()">语音解说</button>

  <button class="btn btn-primary " data-toggle="modal"
          data-target="#Skygroundcover" data-backdrop="static">天空/地面遮盖</button>

  <button class="btn btn-primary" data-toggle="modal"
          data-target="#Openingtips" data-backdrop="static">开场提示</button>

  <button class="btn btn-primary" data-toggle="modal"
          data-target="#Functionenable" data-backdrop="static">功能启用</button>
<button class="btn bg-primary" id="save_btn" onclick="saveall_btn()" >保存设置</button>

  <script src="js/jquery.min.js" type="text/javascript"></script>
  <script src="js/bootstrap.min.js" type="text/javascript"></script>
  <script type="text/javascript">
//    页面保存按钮
function saveall_btn() {

  $.ajax({
    url: "saveall",
    type: "post",
    success: function () {
      alert("保存成功！");

    },
    error: function () {
      alert("error");
    }

  })

}
    $(".edit_checkbox").click(

            function () {
              if ($(this).val() == '0' )
              {
                $(this).val('1');
              }else {
                $(this).val('0');
              }
            }
    )

    function fun_btn() {
      var checkboxstr ="";
      $(".edit_checkbox").each(function () {
        checkboxstr += $(this).val()+":";
      })
      var str = checkboxstr.split(":");
      var checkJson="{";
      var checkname = new Array(
              "planet","viewchoose","autoround","doplace","showtellone","phone","vrglass","autorname"
      );
      for(var i= 0;i< str.length;i++)
      {
        if(i<str.length-1)
        {
          checkJson =checkJson+"\"" + checkname[i] +"\""+":"+"\""+str[i]+"\""+",";
        }
        else {
          checkJson =checkJson+"\"" + checkname[i] +"\""+":"+"\""+str[i]+"\""+"}";
        }
      }
      checkJson = eval('('+checkJson+')');
      alert(checkJson);

      $.ajax({
        url:"function",
        type:"post",
        data:checkJson,
        success:function () {

        },
        error:function () {

        }
      })
    }
    function testAddVoiceSession() {
      $.ajax({
        type:"post",
        url:"voicesave",
        datatype:"json",
        data:{
         voicename:"voice1.mp3",
        },
        success:function () {
        },
        error:function () {
        }
      })

    }

    function testMusicSession(name) {
      $.ajax({
        type:"post",
        url:"CameraServlet",
        datatype:"json",
        data:{
          musicname:name,
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
            var voice= "voice1.mp3";
          for (var i = 0; i < data.name.length; i++) {
            $("#voiceitems").append("<tr>" +
                    "<td>"+i+1+"</td>" +
                    "<td>"+data.name[i]+"</td>" +
                    "<td><audio src='./voice/voice1.mp3' class='voice' controls='controls' preload id='voice1' hidden /> <button id='a' class='btn btn-primary'  onclick='voiceaudio()'>试听/暂停</button></td>" +
                    "<td><button class='btn btn-primary' onclick='testAddVoiceSession()'>设为背景音乐</button></td>" +
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
