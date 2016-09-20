/**
 * Created by ZZ on 2016/9/20.
 */
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