package cn.zane.Service;

import org.junit.Test;

import java.io.File;

/**
 * Created by ZZ on 2016/8/4.
 */
public class FileName {
    public static  boolean rename(String path, String oldName, String newName){

        boolean b = new File(path + oldName).renameTo(new File(path + newName));

        return b;
    }

    @Test
    public void  testRename(){
        boolean b = FileName.rename("C:\\Users\\ZZ\\Desktop\\images\\","vtour","test");
        if (b) {
            System.out.println("true");
        }
    }
}
