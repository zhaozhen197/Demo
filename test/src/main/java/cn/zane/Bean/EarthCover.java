package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/22.
 */
public class EarthCover {
    private  String useOrNot;
    private  String name;
    private  String path;
    private   String text;

    public EarthCover() {
    }

    public EarthCover(String useOrNot, String name, String path, String text) {
        this.useOrNot = useOrNot;
        this.name = name;
        this.path = path;
        this.text = text;
    }

    public String getUseOrNot() {
        return useOrNot;
    }

    public void setUseOrNot(String useOrNot) {
        this.useOrNot = useOrNot;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {

        return "EarthCover{" +
                "useOrNot='" + useOrNot + '\'' +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", text='" + text + '\'' +
                '}';
    }
}
