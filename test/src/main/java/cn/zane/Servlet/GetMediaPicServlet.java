package cn.zane.Servlet;

import cn.zane.Service.GetFileList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ZZ on 2016/9/21.
 * 接收媒体库页面的请求
 */
public class GetMediaPicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String realPath= getServletContext().getRealPath("/");
        String mediaPath = realPath + "img\\pic\\";
        File [] files = GetFileList.getFile(mediaPath);
        String jsondata = "{\"name\":[";
        for (int i = 0;i < files.length;i++)
        {
            if (files[i].isFile()){
                if (i < files.length - 1) {
                    System.out.println("Name:" + files[i].getName());
                    jsondata = jsondata + "\"" + files[i].getName() + "\",";
                }else
                {
                    System.out.println("Name:" + files[i].getName());
                    jsondata = jsondata + "\"" + files[i].getName() + "\"";
                }
            }
    }
        jsondata = jsondata + "]}";
        PrintWriter out = response.getWriter();
        out.print(jsondata);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
