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

        FileWriter fileWritter = new FileWriter(pathFile.getName(),true);//追加文件
        BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
        bufferWritter.write(msg);
        bufferWritter.close();

    }
}
