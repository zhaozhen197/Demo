package cn.zane.Servlet;

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
public class VoiceSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voicename = request.getParameter("voicename");
        String realPath=getServletContext().getRealPath("/");
        realPath = realPath+ "voice\\"+voicename;
        Voice voice = new Voice();

        voice.setName(voicename);
        voice.setPath(realPath);

        HttpSession session = request.getSession();

        session.setAttribute("voice",voice);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
