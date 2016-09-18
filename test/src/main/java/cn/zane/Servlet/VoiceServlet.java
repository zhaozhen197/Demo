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
 * Created by ZZ on 2016/9/16.
 */
public class VoiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath =this.getServletContext().getRealPath("/")+"voice\\";

        GetFileList getFileList = new GetFileList();

        File[] files = getFileList.getFile(filePath);


        String jsondata = "{\"name\":[";
        for(int i=0;i<files.length;i++) {
            if (files[i].isFile()) {
                if (i < files.length - 1) {
                    System.out.println("Name:" + files[i].getName());
                    jsondata = jsondata + "\"" + files[i].getName() + "\",";
                }
                else{
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
