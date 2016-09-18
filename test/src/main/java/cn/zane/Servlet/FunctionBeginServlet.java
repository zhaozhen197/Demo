package cn.zane.Servlet;

import cn.zane.Bean.FunctionOpen;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/16.
 */
public class FunctionBeginServlet extends HttpServlet {
    public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FunctionOpen functionOpen = new FunctionOpen();
        functionOpen.setPlanet(request.getParameter("planet"));
        functionOpen.setViewchoose(request.getParameter("viewchoose"));
        functionOpen.setAutoround(request.getParameter("autoround"));
        functionOpen.setDoplace(request.getParameter("doplace"));
        functionOpen.setShowtellone(request.getParameter("showtellone"));
        functionOpen.setPhone(request.getParameter("phone"));
        functionOpen.setVrglass(request.getParameter("vrglass"));
        functionOpen.setAutorname(request.getParameter("autorname"));
        System.out.println(functionOpen);
       HttpSession session= request.getSession();
        session.setAttribute("functionOpen",functionOpen);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
    public void destroy()
    {
        super.destroy();
    }
}
