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
  <h4>全景设置：</h4>
  <button class="btn btn-primary " data-toggle="modal"
          data-target="#mymusic" href="mymusic.html"data-backdrop="static">背景音乐</button>

  <button class="btn btn-primary " data-toggle="modal"
          data-target="#myphoto" data-backdrop="static">相机拍摄数据</button>
  <button type="submit" class="btn btn-primary" data-toggle="modal"
          data-target="#Voiceinterpretation" data-backdrop="static" onclick="voiceOnclick()">语音解说</button>

  <button class="btn btn-primary" data-toggle="modal"
          data-target="#Earthcover" data-backdrop="static">地面遮盖</button>

  <button class="btn btn-primary" data-toggle="modal"
          data-target="#Openingtips" data-backdrop="static">启动画面</button>

  <button class="btn btn-primary" data-toggle="modal"
          data-target="#Functionenable" data-backdrop="static">功能启用</button>
  <button class="btn bg-primary" id="save_btn" onclick="saveall_btn()" >保存设置</button>

  <%
      List<Music> musics = new ArrayList<>();
      Music music = null;
      for(int i = 1; i<5;i++) {
          music = new Music(i ,""+i, "a();", null);
          musics.add(music);
      }
      request.setAttribute("musics",musics);
  %>


  <%--背景音乐--%>
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
                                      <audio src="./music/${music.name}.mp3" class="music" controls="controls" preload id="${music.id}" hidden >

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
  <%--背景音乐--%>

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

  <div class="modal fade" id="Earthcover" tabindex="-1">
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
                                      <input type="radio"  class="radio_default_cover" value="0" id="no_default_cover" onclick="raidoNo_use_default_cover()" checked>不使用遮盖
                                  </label>
                              </div>
                          </td>
                          <td>
                              <div class="control-group">
                                  <!-- Multiple Checkboxes -->
                                  <label class="radio inline">
                                      <input type="radio" name="use_or_not" onclick="raido_use_default_cover()" value="0" class="radio_default_cover" id="use_default_cover" >使用系统遮盖
                                  </label>
                              </div>
                          </td>
                          <td>
                              <button class="btn btn-default" data-toggle="modal"
                                      data-target="#coverchoose" data-backdrop="static" onclick="show_container_pic_cover()">从媒体库中选择</button>
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
  <div class="modal fade" id="coverchoose" tabindex="-1">
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


<%--开场提示--%>
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
        <table class= "table" table-striped>
          <tbody>
          <tr>
            <td>
              <div class="control-group">
                <!-- Multiple Checkboxes -->
                <label class="radio inline">
                  <input type="radio" name="use_or_not" class="radio_default" value="0" id="no_default" onclick="raidoNo_use_default()" checked>不使用启动画面
                </label>
              </div>
            </td>
            <td>
              <div class="control-group">
                <!-- Multiple Checkboxes -->
                <label class="radio inline">
                  <input type="radio" name="use_or_not" onclick="raido_use_default()" value="0" class="radio_default" id="use_default" >使用默认启动画面
                </label>
              </div>
            </td>
            <td>
              <button class="btn btn-default" data-toggle="modal"
                      data-target="#choose" data-backdrop="static" onclick="show_container_pic()">从媒体库中选择</button>
            </td>
            <td>
              <img id ="openview_pic" src="./img/pic/a.png" alt="" height="30"width="30" >
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
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="raidoOnclick()">保存</button>
      </div>
    </div>
  </div>
</div>

<%--从素材库选取--%>
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
<%--从素材库选取--%>
<%--开场提示--%>


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

  <script src="js/jquery.min.js" type="text/javascript"></script>
  <script src="js/bootstrap.min.js" type="text/javascript"></script>
  <script src="js/myJS.js" type="text/javascript"></script>
  </body>
</html>
