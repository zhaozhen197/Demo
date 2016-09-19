package cn.zane.Servlet;

import cn.zane.Bean.ImageBean;
import cn.zane.Service.GetFileList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZZ on 2016/9/15.
 */
public class GetSmallPicListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = "e:/images";
        //获取oldPicList
        File[]  oldfiles = GetFileList.getFile(filePath);

        List<ImageBean> imageBeanList = new ArrayList<ImageBean>() ;

        String imagePath;
        String [] pathes;
        ImageBean imageBean;
       //生成newSmallPic

        for(int i = 0;i<oldfiles.length;i++){
//            Smallpic.getSmallPic(oldfiles[i].getPath(),"e:/smallpic/"+oldfiles[i].getName());
        }
        //判断新文件夹是否为空
        String realPath=getServletContext().getRealPath("/");
        System.out.println(realPath);
        File[] newfiles = GetFileList.getFile(realPath+"/smallpic");
        if (newfiles.length  == 0){}

        for(int i=0;i<newfiles.length;i++) {
            if (newfiles[i].isFile()) {
                imagePath = newfiles[i].getPath();

                imageBean = new ImageBean(newfiles[i].getName(),imagePath);
                System.out.println(imageBean.getPath());
                System.out.println(imageBean);
                imageBeanList.add(imageBean);
            }
        }
        System.out.println(imageBeanList.isEmpty());

        request.setAttribute("imageBeanList",imageBeanList);
        request.setAttribute("path","C:\\Users\\ZZ\\IdeaProjects\\Demo\\test\\target\\test\\smallpic\\2-nanmen.jpg");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/SmallPicList.jsp");
        requestDispatcher.forward(request,response);
//        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
