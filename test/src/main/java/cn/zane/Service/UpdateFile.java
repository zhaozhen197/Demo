package cn.zane.Service;

import java.io.*;

/**
 * Created by ZZ on 2016/9/20.
 */
public class UpdateFile {

    public static void main(String[] args) throws Exception {
        File file = new File("C:\\Users\\ZZ\\Desktop\\tour.xml");
        updateStringInFile(file);
        System.out.println("end");
    }
    /**
     * 在文件里面的指定行插入一行数据
     *
     * @param inFile
     *          文件
     * @throws Exception
     *           IO操作引发的异常
     */
    public static void updateStringInFile(File inFile)
            throws Exception {
        // 临时文件
        File outFile = File.createTempFile("updateTmp", ".tmp");
        // 输入
        FileInputStream fis = new FileInputStream(inFile);
        BufferedReader in = new BufferedReader(new InputStreamReader(fis));
        // 输出
        FileOutputStream fos = new FileOutputStream(outFile);
        PrintWriter out = new PrintWriter(fos);
        // 保存一行数据
        String thisLine;
        // 行号从1开始
        int i = 1;
        while ((thisLine = in.readLine()) != null) {
            // 如果行号等于目标行，则输出要插入的数据
            System.out.println(i+thisLine);

            if (i == 14){
                thisLine = "littleplanetintro=\"true\"";
            }

            // 输出读取到的数据
            out.println(thisLine);
            // 行号增加
            i++;
        }
        out.flush();
        out.close();
        in.close();
        // 删除原始文件
        inFile.delete();
        // 把临时文件改名为原文件名
        outFile.renameTo(inFile);
    }
}

