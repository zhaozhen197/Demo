package cn.zane.Servlet;

import cn.zane.Bean.*;
import cn.zane.Service.GenerateVR;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/19.
 */
public class SaveAllServlet extends HttpServlet {
    /**
     * 从session 中提取相关信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String realPath=getServletContext().getRealPath("/");

        Music music;
//        Voice voice;
        FunctionOpen functionOpen ;
        //获得背景音乐
        music = (Music) session.getAttribute("music");
//        voice = (Voice) session.getAttribute("voice");
        //获得功能设置
        functionOpen = (FunctionOpen) session.getAttribute("functionOpen");
        //获得补地图片
        OpenViewBean earthCover = (OpenViewBean) session.getAttribute("openViewCover");
        //获得启动页面
        OpenViewBean openView = (OpenViewBean) session.getAttribute("openViewBean");

        Set set = new Set();
        set.setMusic(music);
        set.setFunctionOpen(functionOpen);
        set.setEarthCover(earthCover);
        set.setOpenView(openView);
//        set.setVoice(voice);

        System.out.println("generate music");
        //生成vr 文件
        try {
            new GenerateVR().generateVR(set,realPath);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /*System.out.println(music);
        System.out.println(voice);
        System.out.println(functionOpen);*/

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
