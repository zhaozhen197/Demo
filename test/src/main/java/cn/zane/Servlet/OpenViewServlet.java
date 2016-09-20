package cn.zane.Servlet;

import cn.zane.Bean.OpenViewBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/20.
 * openview servlet
 */
public class OpenViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String defalut = request.getParameter("defaultView");
        String text = request.getParameter("text");


        OpenViewBean openViewBean = new OpenViewBean();
        openViewBean.setUse_or(defalut);
        openViewBean.setText(text);
        HttpSession session = request.getSession();
        session.setAttribute("openViewBean",openViewBean);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
