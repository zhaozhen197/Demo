package cn.zane.Service;

import cn.zane.Bean.*;

import java.io.IOException;

/**
 * Created by ZZ on 2016/9/19.
 */
public class GenerateVR {
    /**
     * 调用krpano 生成vr
     * @param set
     * set:function set open
     * @param rootRealPath
     * '/' path
     */
    public static void generateVR(Set set,String rootRealPath) throws Exception {
        //全景图片的路径
        String imagespath = rootRealPath + "images\\";
        //调用krpano 生成进程
        Process p = new KrpanoGenerateFile().getFile(imagespath);
        if ( p == null){
            System.out.println("generate success");
        }


        Music music = set.getMusic();
        /*Voice voice = set.getVoice();
        Pic pic = set.getPic();
        Camera camera = set.getCamera();*/
        FunctionOpen functionOpen = set.getFunctionOpen();
        OpenViewBean earthCover = set.getEarthCover();
        OpenViewBean openView = set.getOpenView();

        boolean flag = false;

        if (music != null){
            System.out.println(music.getUrl());
            AddMusicXml addMusicXml = new AddMusicXml();

            try {
                flag = addMusicXml.addMussic(music, rootRealPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag) {
                System.out.println("generate_vr addmusic ok");
            }

        }

        if(openView != null){
            String usrOrnot = openView.getUse_or();
            System.out.println(usrOrnot+"****");
            if (usrOrnot.equals("use_default")){
                try {
                    GenerateOpenViewXml.generateOpenViewXml(imagespath+"vtour\\OpenView.xml",openView.getOpenview_pic().getName(),openView.getText());
                    AddOpenView.addOpenView(openView, rootRealPath);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                System.out.println("open view is null");

            }
        }

        if (earthCover != null) {
            String usrOrnot =earthCover.getUse_or();
            if (usrOrnot.equals("use_default_cover")){
                try {
                    GenerateEarthCoverXml.generateEarthCoverXml(imagespath+"vtour\\earthCover.xml",earthCover.getOpenview_pic().getName(),earthCover.getText());
                    AddOpenView.addOpenView(earthCover, rootRealPath);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                System.out.println("earth cover is null");

            }
        }
        if(functionOpen != null) {
            try {
                flag = addFunXml.addFun(functionOpen, rootRealPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag) {
                System.out.println("funxml ok");
            }
        }
    }

}
