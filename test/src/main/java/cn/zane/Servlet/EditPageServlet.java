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

        String cameraPattern;//相机型号
        String cameraShot ;//镜头型号
        String yunTaiType;//云台型号
        String ligthRing;//光圈大小

        Camera camera = new Camera();
        camera.setCameraPattern(request.getParameter("cameraPattern"));
        camera.setCameraShot(request.getParameter("cameraShot"));
        camera.setYunTaiType(request.getParameter("yunTaiType"));
        camera.setLigthRing(request.getParameter("ligthRing"));
        System.out.println(camera);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
