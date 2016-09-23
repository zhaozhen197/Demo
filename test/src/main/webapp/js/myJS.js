/**
 * Created by ZZ on 2016/9/20.
 */
// 编辑
function showView_first_edit() {
    $("#showViewFirst_edit").after("<div class='modal fade'  id='ShowView_edit' tabindex='-1'>"+
    "<div class='modal-dialog'>"+
        "<div class='modal-content'>"+
        "<div class='modal-header'>"+
        "<button class='close' data-dismiss='modal'><span>&times;</span></button>"+
    "<h4 class='modal-title'>启动画面</h4>"+
        "</div>"+
        "<div class='modal-body' id='showViewFirst_div_edit'>"+

        "<iframe width='560px' height='400px' src='images/vtour/tour_editor.html'></iframe>"+

        "</div>"+
        "<div class='modal-footer'>"+
        "<button type='button' class='btn btn-default' data-dismiss='modal' onclick='close_showView_edit()' >关闭</button>"+
"</div>"+
"</div>"+
"</div>"+
"</div>")
}
function close_showView_edit() {
    $("#ShowView_edit").empty();
}
function close_showView() {
    $("#ShowView").empty();
}
// 浏览
function showView_first() {
    $("#showViewFirst").after("<div class='modal fade'  id='ShowView' tabindex='-1'>"+
        "<div class='modal-dialog'>"+
        "<div class='modal-content'>"+
        "<div class='modal-header'>"+
        "<button class='close' data-dismiss='modal'><span>&times;</span></button>"+
        "<h4 class='modal-title'>启动画面</h4>"+
        "</div>"+
        "<div class='modal-body' id='showViewFirst_div_edit'>"+

        "<iframe width='560px' height='400px' src='images/vtour/index.html'></iframe>"+

        "</div>"+
        "<div class='modal-footer'>"+
        "<button type='button' class='btn btn-default' data-dismiss='modal' onclick='close_showView()' >关闭</button>"+
        "</div>"+
        "</div>"+
        "</div>"+
        "</div>")
}
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
                $(".container_pic_tr").eq(temp-1).after("<tr class='container_pic_tr'></tr>");
                for (var j = 4 * temp; j < data.name.length; j++) {
                    $(".container_pic_tr").eq(temp).append("<td><div style='width:50px; height:50px;' class='col-md-6'><img  src='images/smallpic/" + data.name[i * 4 + 2] + "'></div>" +
                    "<div class='col-md-6'><input value='" + data.name[i * 4 + 2] + "' type='text'/><a href='#'>移除</a></div>  </td>");
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