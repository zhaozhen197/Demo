package cn.zane.Service;

import cn.zane.Bean.Music;

import java.io.File;

/**
 * Created by ZZ on 2016/9/20.
 */
public class AddMusicXml {
    /**
     * 将歌曲的配置文件加入到项目
     * @param music
     * @param realPath
     */
    public  boolean  addMussic(Music music ,String realPath) throws Exception {

        String musicXmlPath = realPath+"source\\";
        String tarPath = realPath+"images\\vtour\\";
        File touXml = new File(tarPath+"tour.xml");
        InsertFile insertFile = new InsertFile();
        System.out.println(tarPath);
        boolean flag=false;
        if(new File(tarPath).exists()){
            FileCopy fileCopy= new FileCopy();
            fileCopy.copyFunc(musicXmlPath,tarPath,"sound.xml");
            fileCopy.copyFunc(realPath+"music\\",tarPath,music.getName());
            insertFile.insertStringInFile(touXml,79,"\t<include url=\"sound.xml\"/>");
            flag = true;
        }

        try {
            insertFile.insertStringInFile(touXml,72,"\tplaysound(bgsnd,\'" + music.getName()+"\', 0);");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }


}
