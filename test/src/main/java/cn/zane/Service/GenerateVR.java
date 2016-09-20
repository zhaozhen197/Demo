package cn.zane.Service;

import cn.zane.Bean.*;

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
    public static void generateVR(Set set,String rootRealPath){
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


        if (music != null){
            System.out.println(music.getUrl());
            AddMusicXml addMusicXml = new AddMusicXml();
            boolean flag = false;
            try {
                flag = addMusicXml.addMussic(music, rootRealPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag) {
                System.out.println("generate_vr addmusic ok");
            }

            try {
                flag = addFunXml.addFun(functionOpen,rootRealPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag)
            {
                System.out.println("funxml ok");
            }


        }

    }

}
