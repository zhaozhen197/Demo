package cn.zane.Service;

import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/15.
 */
public class Smallpic {
// public static void main(String oldPicPath,String newPicPath) {
     public static void main(String[] oldPicPath) {
//keepAspectRatio(false) 默认是按照比例缩放的
         /*try {
             Thumbnails.of(oldPicPath)
                     .size(200, 150)
                     .keepAspectRatio(false)
                     .toFile(newPicPath);
         } catch (Exception e) {
             e.printStackTrace();
         }*/
         GetFileList getFileList = new GetFileList();
        File[] array = getFileList.getFile("C:\\Users\\ZZ\\IdeaProjects\\Demo\\test\\target\\test\\images");
         for (int i = 0;i<array.length;i++) {
             System.out.println(array[i].getName());
             if (array[i].isFile()) {
                 try {
                     Thumbnails.of(array[i].getPath())
                             .size(30, 30)
                             .keepAspectRatio(false)
                             .toFile("C:\\Users\\ZZ\\IdeaProjects\\Demo\\test\\target\\test\\images\\smallpic\\" + array[i].getName());
                 } catch (IOException e) {
                     e.printStackTrace();
                 }
             }
         }

     }




}
