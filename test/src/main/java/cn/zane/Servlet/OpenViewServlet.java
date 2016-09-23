package cn.zane.Servlet;

import cn.zane.Bean.OpenViewBean;
import cn.zane.Bean.Pic;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/20.
 * openview servlet
 */
public class OpenViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String defalut = request.getParameter("defaultView");
        String text = request.getParameter("text");
        String path = request.getParameter("path");
        String name = path.substring(path.lastIndexOf("/")+1);

        Pic pic = new Pic();
        pic.setPath(path);
        pic.setName(name);
        System.out.println(name+"**********");
        OpenViewBean openViewBean = new OpenViewBean();
        openViewBean.setUse_or(defalut);
        openViewBean.setText(text);
        openViewBean.setOpenview_pic(pic);

        System.out.println(openViewBean);
        System.out.println(path);
        HttpSession session = request.getSession();
        session.setAttribute("openViewBean",openViewBean);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
