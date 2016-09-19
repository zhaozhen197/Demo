package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/19.
 */
public class Pic {
    private String name;
    private String path;
    private String size;

    public Pic() {
    }

    public Pic(String name, String path, String size) {
        this.name = name;
        this.path = path;
        this.size = size;
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Pic{" +
                "name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", size='" + size + '\'' +
                '}';
    }
}
