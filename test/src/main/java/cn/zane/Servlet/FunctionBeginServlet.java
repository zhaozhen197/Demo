package cn.zane.Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/16.
 */
public class FunctionBeginServlet extends HttpServlet {
    public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String[] checkboxes = request.getParameterValues("checkbox");
        for (int i=0;i<checkboxes.length;i++)
        {
            System.out.println(checkboxes[i]);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
    public void destroy()
    {
        super.destroy();
    }
}
