package cn.zane.Service; /**
 * Created by ZZ on 2016/8/4.
 */
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 * 编写程序，copy file
 */
public class FileCopy {
    public static void copyFunc(String srcPath , String tarPath ,String name){
        try {
            // 读取文件绝对路径
            File file = new File(srcPath + name);
            File tarFile = new File( tarPath + name);
//            tarFile.isDirectory();
            // 文件输入输出流
            FileInputStream fis = new FileInputStream(file);
            FileOutputStream fos = new FileOutputStream(tarFile);
            if (file.exists()) {
                int b = 0;
                // 判断是否到文件结尾
                while ((b = fis.read()) != -1) {
                    fos.write(b); // 复制旧文件的内容到新文件
                    fos.flush();
                }
            } // 关闭源， 先开的后关，后开的先关
            fos.close();
            fis.close();
            System.out.println("文件复制完毕！");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void reName(String srcPath, String destPath,String rename){
        File filePre = new File(srcPath);
        File fileNew = new File(destPath); // 设置新的文件名
        if (!filePre.exists()) { // 判断旧文件是否存在
            System.out.println("文件不存在");
        }else{ // 文件存在就重命名
            filePre.renameTo(fileNew);
            System.out.println("重命名完成！");
        }
    }

    /**
     * copy directory
     * @param srcPath
     * @param destPath
     * @return
     */
    public static  boolean copyDirectory(String srcPath , String destPath){
        boolean flag = false;

        File src = new File(srcPath);

        File dest = new File(destPath);
        if (!dest.exists()){
            dest.mkdir();
        }
        try {
            FileUtils.copyDirectory(src, dest);
            flag = true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return  flag;

    }


    public static void main(String[] args) {

        boolean flag = copyDirectory("C:\\Users\\ZZ\\Desktop\\mine\\images","C:\\Users\\ZZ\\Desktop\\images\\test\\images");

        if (flag){
            System.out.println("copy success!");
        }

    }
}
