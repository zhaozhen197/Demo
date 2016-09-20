package cn.zane.Servlet;

import cn.zane.Bean.Music;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/15.
 */
public class EditPageServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


        String musicname = request.getParameter("musicname");
        String realPath=getServletContext().getRealPath("/");
        realPath = realPath + "music\\";

        Music music = new Music();
        music.setName(musicname+".mp3");
        music.setUrl(realPath+musicname+".mp3");

        HttpSession session = request.getSession();
        session.setAttribute("music",music);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
