package cn.zane.Service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


/**
 * Created by ZZ on 2016/9/23.
 *
 * 将数据写入文件
 */
public class WriteToFile {
    public  static void writeToFile(String msg,File pathFile) throws IOException {

        if (!pathFile.exists()){
            pathFile.createNewFile();
        }

        BufferedWriter output = new BufferedWriter(new FileWriter(pathFile));
        output.write(msg);
        output.close();
    }
}
