package cn.zane.Service;


import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZZ on 2016/8/4.
 */
public class Main {
    public static void main(String[] args) throws InterruptedException {

        //  生成 vtour 文件夹
        String path = "C:\\Users\\ZZ\\Desktop\\images\\";
        Process p = new TestFile().getFile(path);
        /*  if (p != null){

            p.waitFor();

        }*/
        // 复制相关文件夹

        copyfile();

        //tour.xml 添加内容

        insertValue();


    }

    public static void insertValue() {
        String tourPath = "C:\\Users\\ZZ\\Desktop\\images\\vtour\\tour.xml";
        File tour = new File(tourPath);
        String myskinPath = "\t<include url=\"code/myskin.xml\"/>";
        String soundPath = "\t<include url=\"sound/sound.xml\"/>";
        String qrCodePath = "\t<include url=\"code/qr.xml\"/>";
//        String nvCompassPath = "\t<include url=\"xmls/nv.xml\"/>";

        List<String> pathes = new ArrayList<String>();

        pathes.add(myskinPath);
        pathes.add(soundPath);
        pathes.add(qrCodePath);
//        pathes.add(nvCompassPath);

        for (String paths: pathes){

            try {
                InsertFile.insertStringInFile(tour,3,paths);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    @Test
    public static void copyfile() {
        String srcPath = "C:\\Users\\ZZ\\Desktop\\mine\\";

        List<String> dirs = new ArrayList<String>();
        dirs.add("code");
        dirs.add("images");
        dirs.add("sound");
        dirs.add("xmls");
        String tarPath = "C:\\Users\\ZZ\\Desktop\\images\\vtour\\";

        for (String dir : dirs) {
            FileCopy.copyDirectory(srcPath + dir, tarPath + dir);
        }
    }
}
