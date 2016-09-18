package cn.zane.Service;

import net.coobird.thumbnailator.Thumbnails;

import java.io.IOException;

/**
 * Created by ZZ on 2016/9/15.
 */
public class Smallpic {
// public static void main(String oldPicPath,String newPicPath) {
     public static void main(String[] oldPicPath) throws IOException {
//keepAspectRatio(false) 默认是按照比例缩放的
         /*try {
             Thumbnails.of(oldPicPath)
                     .size(200, 150)
                     .keepAspectRatio(false)
                     .toFile(newPicPath);
         } catch (Exception e) {
             e.printStackTrace();
         }*/

             Thumbnails.of("e:/images/2-nanmen.jpg")
                     .size(200, 150)
                     .keepAspectRatio(false)
                     .toFile("e:/smallpic/2-nanmen.jpg");
     }




}
