<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>音乐背景</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
    </style>
</head>
<body >

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
                       <table class= "table" table-striped  >
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>歌曲名</th>
                                    <th>试听</th>
                                    <th>设为背景音乐</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>
                                        <div id="1">
                                            <audio src="./img/1.mp3" controls="controls" preload id="one" hidden>
                                            </audio>
                                            <button id="a" class="btn btn-primary btn-lg"  onclick="a();">试听/暂停</button>
                                        </div>
                                     </td> 

                                  
                                    <td>
                                    <a href="#" class="btn btn-primary"> 设为背景音乐</a>
                                    </td>

                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>

                                        <div id="2">
                                           <audio src="./img/2.mp3" controls="controls" preload id="two
                                           " hidden>
                                            </audio>
                                            <button id="b" class="btn btn-primary btn-lg"  onclick="b();">试听/暂停</button>
                                        </div>




                                    </td>
                                    <td> <a href="#" class="btn btn-primary"> 设为背景音乐</a></td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>3</td>
                                    <td><div id="3">
                                             <audio src="./img/3.mp3" controls="controls" preload id="three" hidden>
                                            </audio>
                                            <button id="c" class="btn btn-primary btn-lg"  onclick="c();">试听/暂停</button>
                                            </div>
                                     </td>
                                    <td> <a href="#" class="btn btn-primary"> 设为背景音乐</a></td>
                                </tr>

                                <tr>
                                    <td>4</td>
                                    <td>4</td>
                                    <td> <audio src="./img/4.mp3" controls="controls" preload id="four" hidden>
                                            </audio>
                                            <button id="d" class="btn btn-primary btn-lg"  onclick="d();">试听/暂停</button></td>
                                    <td> <a href="#" class="btn btn-primary"> 设为背景音乐</a></td>
                                </tr>



                            </tbody>







                       </table>

                        <h4>
                            自定义上传音乐：
                        </h4>
                   </div>                      
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
                          <input type="text" class="form-control" placeholder=" ">
                        </div>

                        <div class="input-group">
                          <span class="input-group-addon">镜头型号：</span>
                          <input type="text" class="form-control" placeholder=" ">
                        </div>

                        <div class="input-group">
                          <span class="input-group-addon">云台型号：</span>
                          <input type="text" class="form-control" placeholder=" ">
                        </div>


                        <div class="input-group">
                          <span class="input-group-addon">光圈大小：</span>
                          <input type="text" class="form-control" placeholder=" ">
                        </div>
                    </div>
       
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">保存</button>
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
                <div id="voiceitems" >


                </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="voiceCloseBtnOnclick()">关闭</button>
                        <button type="button" class="btn btn-primary">保存</button>
                    </div>
            </div>
        </div>
    </div>


 <!-- 语音解说 -->





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


 <!-- 开场提示 -->


<button class="btn btn-primary btn-lg" data-toggle="modal" 
         data-target="#mymusic" href="mymusic.html"data-backdrop="static">背景音乐</button>

<button class="btn btn-primary btn-lg" data-toggle="modal" 
         data-target="#myphoto" data-backdrop="static">相机拍摄数据</button>


 <button id="voicebtn" onclick="voiceOnclick()" class="btn btn-primary btn-lg" data-toggle="modal"
         data-target="#Voiceinterpretation" data-backdrop="static">语音解说</button>

 <button class="btn btn-primary btn-lg" data-toggle="modal" 
         data-target="#Skygroundcover" data-backdrop="static">天空/地面遮盖</button>

 <button class="btn btn-primary btn-lg" data-toggle="modal" 
         data-target="#Openingtips" data-backdrop="static">开场提示</button>

 <button class="btn btn-primary btn-lg" data-toggle="modal" 
         data-target="#Functionenable" data-backdrop="static">功能启用</button>






<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    function voiceCloseBtnOnclick(){
        $("#voiceitems").empty()
    }
    function voiceOnclick() {
        alert("ok");
        $("#voiceitems").append("<p>testkakaka</p>");
        $.ajax({
            type: "post",
            url:"voice",
            dataType:"json",
            success:function (data) {
                alert("success")
                for (var i = 0; i < data.name.length; i++) {
                    $("#voiceitems").append("<p>"+data.name[i]+"</p>");
                };
            },
            error:function () {
                alert("error");
            }
        })
    }

   function a(){
     var audio = document.getElementById('one'); 
     if(audio.paused){                 
         audio.play();//audio.play();// 试听 
     }
     else{
          audio.pause();// 暂停
     } 
   }

    function b(){
     var audio = document.getElementById('two'); 
     if(audio.paused){                 
         audio.play();//audio.play();// 试听 
     }
     else{
          audio.pause();// 暂停
     } 
   }

    function c(){
     var audio = document.getElementById('three'); 
     if(audio.paused){                 
         audio.play();//audio.play();// 试听 
     }
     else{
          audio.pause();// 暂停
     } 
   }

    function d(){
     var audio = document.getElementById('four'); 
     if(audio.paused){                 
         audio.play();//audio.play();// 试听 
     }
     else{
          audio.pause();// 暂停
     } 
   }
</script>

<script type="text/javascript">

</script>



</body>
</html>