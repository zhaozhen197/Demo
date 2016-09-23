package cn.zane.Service;

import java.io.File;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/23.
 */
public class GenerateEarthCoverXml {
    /**
     * 生成席地文件
     * @param filePath
     * 文件路径
     * @param name
     * @param text
     * 链接地址
     * @throws IOException
     */
    public static void  generateEarthCoverXml(String filePath ,String name ,String text) throws IOException {
        File file = new File(filePath);

        String xmlFile = "<krpano><hotspot name=\"nadirlogo\" keep=\"true\"";
        xmlFile = xmlFile + "  url=\"" + name+"\"  ";
        xmlFile = xmlFile + "\tath=\"0\"\n" +
                "\t         atv=\"90\"\n" +
                "\t         distorted=\"true\"\n" +
                "\t         scale=\"1.0\"\n" +
                "\t         rotate=\"0.0\"\n" +
                "\t         onclick=\"openurl('";
        xmlFile = xmlFile + text +"');\"/>";
        xmlFile = xmlFile + "<events name=\"nadirlogo\" keep=\"true\" onviewchange=\"copy(hotspot[nadirlogo].rotate, view.hlookat);\" />";
        xmlFile = xmlFile + "</krpano>";

        WriteToFile.writeToFile(xmlFile,file);
        System.out.println("generate earthCocer xml ok");
    }

}
