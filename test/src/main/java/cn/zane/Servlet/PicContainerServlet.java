package cn.zane.Servlet;

import cn.zane.Service.GetFileList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import static cn.zane.Service.GetFileList.getFile;

/**
 * Created by ZZ on 2016/9/20.
 */
public class PicContainerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String realPath=getServletContext().getRealPath("/");
        File[] arrFile =  getFile(realPath+"images\\smallpic");
        String jsondata = "{\"name\":[";
        for (int i =0;i<arrFile.length;i++){
            if(arrFile[i].isFile()){
                if (i < arrFile.length - 1) {
                    System.out.println("name:" + arrFile[i].getName());
                    jsondata = jsondata + "\"" + arrFile[i].getName() + "\",";
                }
                else{
                    jsondata = jsondata + "\"" + arrFile[i].getName() + "\"]";
                }
            }
        }

        jsondata = jsondata + "}";
        System.out.println(jsondata);
        PrintWriter out = response.getWriter();
        out.print(jsondata);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
