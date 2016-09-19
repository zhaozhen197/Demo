package cn.zane.Service; /**
 * Created by ZZ on 2016/8/4.
 * 给文件增加一行数据。
 *
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
public class InsertFile {


    public static void main(String args[]) {
        File vtour = new File("C:\\Users\\ZZ\\Desktop\\12.txt");
        try {
            InsertFile j = new InsertFile();
            j.insertStringInFile(vtour, 3, "qwe");
            System.out.println("end");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 在文件里面的指定行插入一行数据
     *
     * @param inFile
     *          文件
     * @param lineno
     *          行号
     * @param lineToBeInserted
     *          要插入的数据
     * @throws Exception
     *           IO操作引发的异常
     */
    public static void insertStringInFile(File inFile, int lineno, String lineToBeInserted)
            throws Exception {
        // 临时文件
        File outFile = File.createTempFile("insertTmp", ".tmp");
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
            if (i == lineno) {
                out.println(lineToBeInserted);
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