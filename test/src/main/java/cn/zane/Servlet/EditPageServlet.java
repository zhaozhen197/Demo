package cn.zane.Servlet;

import cn.zane.Bean.Camera;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/15.
 */
public class EditPageServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

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

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
