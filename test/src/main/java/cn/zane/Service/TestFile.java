package cn.zane.Service;

import java.io.*;

/**
 * Created by ZZ on 2016/8/4.
 */
public class TestFile {

    public static void main(String[] args) {
        // This is the path where the file's name you want to take.
        String path = "C:\\Users\\ZZ\\Desktop\\images";
        getFile(path);
    }

    public  static Process  getFile(String path) {
        // get file list where the path has
        File file = new File(path);
        // get the folder list
        File[] array = file.listFiles();

        String filePathes = "";

        if (array != null) {  //没权限访问，则会报错文件为null
            for (int i = 0; i < array.length; i++) {
                if (array[i] != null) {
                    if (array[i].isFile()) {//可以这样判断 if (obj instanceof File)
                        System.out.println(array[i]);
                        filePathes = filePathes + array[i];
                        filePathes = filePathes + " ";
                    }
                }

            }
        }

        try {
            Process p = Runtime.getRuntime().exec("d:\\kr\\normal.bat " + filePathes);
            InputStream in = p.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String tmp = null;
            while((tmp=br.readLine())!=null){
                System.out.println(tmp);
                if(tmp.trim().equals("done.")){
                    p.destroy();
                }
            }

            System.out.println(filePathes);

            return p;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}