package cn.zane.TestServlet;

import bsh.util.Sessiond;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/17.
 */
public class BackGroundSoundServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String musicname = request.getParameter("musicname");
        String voicename = request.getParameter("voicename");

        HttpSession session = request.getSession();
        session.setAttribute("musicname",musicname);
        session.setAttribute("voicename",voicename);


        String testsession = (String) session.getAttribute("musicname");
        String testvoiceSession = (String) session.getAttribute("voicename");
        System.out.println(testsession);
        System.out.println(testvoiceSession);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
