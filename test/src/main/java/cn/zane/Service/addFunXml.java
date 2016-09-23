package cn.zane.Service;

import cn.zane.Bean.FunctionOpen;

import java.io.File;

/**
 * Created by ZZ on 2016/9/20.
 */
public class addFunXml {

    /**
     * function open
     *
     * @param functionOpen
     * @param realPath
     * @return boolean
     */
    public static boolean addFun(FunctionOpen functionOpen, String realPath) throws Exception {
        boolean flag = false;
        InsertFile insertFile = new InsertFile();
        File tourXml = new File(realPath + "images\\vtour\\tour.xml");
        //小行星开场
        if (functionOpen.getPlanet().equals("1")) {
            String tarPath = realPath + "images\\vtour\\" + "tour.xml";
            File file = new File(tarPath);

            UpdateFile updateFile = new UpdateFile();
            updateFile.updateStringInFile(file);

        }


        /**
         * 是否启用自动转动
         */
        if (functionOpen.getAutoround().equals("1")) {
            String autoXmlPath = realPath + "source\\";
            String tarPath = realPath + "images\\vtour\\";

            if (new File(tarPath).exists()) {
                new FileCopy().copyFunc(autoXmlPath, tarPath, "autoround.xml");
                flag = true;
            }


            insertFile.insertStringInFile(tourXml,79,"\t<include url=\"autoround.xml\"/>");

        }

        if (functionOpen.getAutorname().equals("1")){
            String qrCode = realPath + "source\\";
            String tarPath =realPath+  "images\\vtour\\";

            if (new File(tarPath).exists()) {
                FileCopy fileCopy = new FileCopy();
                fileCopy.copyFunc(qrCode, tarPath, "qr.xml");
                fileCopy.copyFunc(qrCode,tarPath,"qrcode.js");
                flag = true;
            }
            insertFile.insertStringInFile(tourXml,79,"\t<include url=\"qr.xml\"/>");
        }



        return flag;
    }
}