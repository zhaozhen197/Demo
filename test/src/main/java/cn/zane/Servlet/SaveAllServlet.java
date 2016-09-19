package cn.zane.Servlet;

import cn.zane.Bean.FunctionOpen;
import cn.zane.Bean.Music;
import cn.zane.Bean.Set;
import cn.zane.Bean.Voice;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Music music;
        Voice voice;
        FunctionOpen functionOpen ;

        music = (Music) session.getAttribute("music");
        voice = (Voice) session.getAttribute("voice");
        functionOpen = (FunctionOpen) session.getAttribute("functionOpen");


        Set set = new Set();
        set.setMusic(music);
        set.setFunctionOpen(functionOpen);
        set.setVoice(voice);

        System.out.println(music);
        System.out.println(voice);
        System.out.println(functionOpen);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
