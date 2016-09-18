package cn.zane.Service;

import java.io.File;

/**
 * Created by ZZ on 2016/9/15.
 */
public class GetFileList {
    public static File[] getFile(String path){
        // get file list where the path has
        File file = new File(path);
        // get the folder list
        File[] array = file.listFiles();

        /*for(int i=0;i<array.length;i++){
            if(array[i].isFile()){
                // only take file name
                System.out.println("Name:" + array[i].getName());
                // take file path and name
                System.out.println("#####" + array[i]);
                // take file path and name
                System.out.println("Path:" + array[i].getPath());
            }
        }*/
        return array;
    }



}
