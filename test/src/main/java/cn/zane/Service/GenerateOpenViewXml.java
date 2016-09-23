package cn.zane.Service;

import org.junit.Test;

import java.io.File;
import java.io.IOException;

/**
 * Created by ZZ on 2016/9/23.
 */
public class GenerateOpenViewXml {

    @Test
    public static void generateOpenViewXml(String path, String name,String text) throws IOException {
        File file = new File(path);
        if (!file.exists()){
            file.createNewFile();
        }
        System.out.println(file.getPath());
        String first = "<krpano>\n" +
                "<!--启动画面-->\n" +
                "\n" +
                "<layer name=\"startpic_container\"\n" +
                "preload=\"true\"\n" +
                "alpha=\"1\"\n" +
                "onloaded=\"tween(alpha,1.0);\"\n" +
                "handcursor=\"true\"\n" +
                "enabled=\"true\"\n" +
                "children=\"true\"\n" +
                "visible=\"true\"\n" +
                "zorder=\"90\"\n" +
                "type=\"container\"\n" +
                "maskchildren=\"true\"\n" +
                "keep=\"true\"\n" +
                "width=\"100%\"\n" +
                "height=\"100%\"\n" +
                "bgcolor=\"0xFFFFFF\"\n" +
                "bgalpha=\"1\" >\n" +
                " \n" +
                "<layer name=\"skin_title_logo3\"\n" +
                "zorder=\"100\"\n" +
                "keep=\"true\"\n" +
                "x=\"0\"\n" +
                "y=\"-80\"\n" +
                "align=\"center\"";
        first = first + " url=\"" + name + "\"";
        first = first +" scale=\"1\"\n" +
                "alpha=\"0\"\n" +
                "onloaded=\"tween(alpha,1.0);tween(layer[skin_title_pr].alpha,1.0);\"\n" +
                "onclick=\"tween(layer[startpic_container].ox,-2500,1);\n" +
                "delayedcall(2,set(layer[startpic_container].enabled,false);\n" +
                "set(layer[startpic_container].visible,false);\n" +
                "stopdelayedcall(startpic1);stopdelayedcall(startpic2);\"\n" +
                "enabled=\"false\" />\n" +
                " \n" +
                "<layer name=\"skin_title_pr\"\n" +
                "background=\"true\"\n" +
                "backgroundcolor=\"0x999999\"\n" +
                "roundedge=\"10\"\n" +
                "backgroundalpha=\"0\"\n" +
                "border=\"true\"\n" +
                "bordercolor=\"0x999999\"\n" +
                "borderalpha=\"0\"\n" +
                "borderwidth=\"4.0\"\n" +
                "glow=\"0\"\n" +
                "glowcolor=\"0xCCCCCC\"\n" +
                "visible=\"true\"\n" +
                "keep=\"true\"\n" +
                "alpha=\"0\"\n" +
                "onloaded=\"\"\n" +
                "children=\"false\"\n" +
                "align=\"center\"\n" +
                "zorder=\"100\"\n" +
                "autowidth=\"auto\"\n" +
                "height=\"40\"\n" +
                "url=\"%SWFPATH%/plugins/textfield.swf\"";
        first = first + " html=\"" + text + "\"";
        first = first + " css=\"text-align:center; color:#9B8179; font-family:SimHei; font-weight:bold; font-size:32px;\"\n" +
                "x=\"0\"\n" +
                "y=\"150\"\n" +
                "onclick=\"tween(layer[startpic_container].ox,-2500,1);\n" +
                "delayedcall(2,set(layer[startpic_container].enabled,false);\n" +
                "set(layer[startpic_container].visible,false);\n" +
                "stopdelayedcall(startpic1);stopdelayedcall(startpic2);\"\n" +
                "enabled=\"false\"\n" +
                " />\n" +
                " \n" +
                "</layer>\n" +
                " \n" +
                "<events name=\"startlogoevents\" keep=\"true\"\n" +
                "onloadcomplete=\"\n" +
                "ifnot(layer[skin_title_logo3].enabled,\n" +
                "set(layer[skin_title_logo3].enabled,true);\n" +
                "set(layer[skin_title_pr].enabled,true);\n" +
                "delayedcall(startpic1,4,tween(layer[startpic_container].ox,-2500,1));\n" +
                "delayedcall(startpic2,5,set(layer[startpic_container].enabled,false);set(layer[startpic_container].visible,false));)\n" +
                "\"/></krpano>";
        WriteToFile.writeToFile(first,file);
        System.out.println("generate openView xml ok");

    }

}
