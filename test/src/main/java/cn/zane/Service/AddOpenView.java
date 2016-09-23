package cn.zane.Service;

import cn.zane.Bean.EarthCover;
import cn.zane.Bean.OpenViewBean;

import java.io.File;

/**
 * Created by ZZ on 2016/9/23.
 *向tour.xml中添加相关xml广播
 */
public class AddOpenView {
    public  static  boolean addOpenView(OpenViewBean earthCover, String realPath) throws Exception {
        boolean flag = false;

        String picPath = realPath+"img\\pic\\";
        String tarPath = realPath+"images\\vtour\\";
        File touXml = new File(tarPath+"tour.xml");
        InsertFile insertFile = new InsertFile();
        if (new File(tarPath).exists()){
            FileCopy fileCopy= new FileCopy();
            fileCopy.copyFunc(picPath,tarPath,earthCover.getOpenview_pic().getName());
            if (earthCover.getUse_or().equals("use_default_cover")) {
                insertFile.insertStringInFile(touXml, 79, "\t<include url=\"earthCover.xml\"/>");
            }

            if (earthCover.getUse_or().equals("use_default")){
                insertFile.insertStringInFile(touXml, 79, "\t<include url=\"OpenView.xml\"/>");
            }
            flag = true;
        }
        return flag;
    }

}
