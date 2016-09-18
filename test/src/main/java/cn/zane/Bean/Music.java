package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/16.
 */
public class Music {
    private  int id;
    private String name;
    private String onclick;
    private String url;

    public Music() {
    }

    public Music(int id, String name, String onclick, String url) {
        this.id = id;
        this.name = name;
        this.onclick = onclick;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Music{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", onclick='" + onclick + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
