package cn.zane.TestServlet;

import cn.zane.Bean.Voice;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ZZ on 2016/9/17.
 */
public class VoiceTestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Voice voice = new Voice();
        voice .setName("aaa");
        voice.setPath("c:\\d");

        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        out.print("{\"name\":\"test\"}");
        out.flush();
        out.close();
        System.out.println("over");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
