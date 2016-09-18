package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/15.
 */
public class ImageBean {
    private String name;
    private String path;

    public ImageBean() {
    }

    public ImageBean(String name, String path) {
        this.name = name;
        this.path = path;
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

    @Override
    public String toString() {
        return "ImageBean{" +
                "name='" + name + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}
