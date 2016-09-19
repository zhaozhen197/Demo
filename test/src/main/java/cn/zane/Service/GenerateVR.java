package cn.zane.Service;

import cn.zane.Bean.*;

/**
 * Created by ZZ on 2016/9/19.
 */
public class GenerateVR {

    public static void generateVR(Set set){
        Music music = set.getMusic();
        Voice voice = set.getVoice();
        FunctionOpen functionOpen = set.getFunctionOpen();
        Pic pic = set.getPic();
        Camera camera = set.getCamera();

        if (music != null){
            System.out.println(music.getUrl());


        }








    }

}
