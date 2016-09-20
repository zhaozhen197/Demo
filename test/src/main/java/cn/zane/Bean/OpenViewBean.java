package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/20.
 */
public class OpenViewBean {
    private String use_or ;
    private String text;
    private Pic openview_pic;

    public OpenViewBean() {
    }

    public OpenViewBean(String use_or, String text, Pic openview_pic) {
        this.use_or = use_or;
        this.text = text;
        this.openview_pic = openview_pic;
    }

    public String getUse_or() {
        return use_or;
    }

    public void setUse_or(String use_or) {
        this.use_or = use_or;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Pic getOpenview_pic() {
        return openview_pic;
    }

    public void setOpenview_pic(Pic openview_pic) {
        this.openview_pic = openview_pic;
    }

    @Override
    public String toString() {
        return "OpenViewBean{" +
                "use_or='" + use_or + '\'' +
                ", text='" + text + '\'' +
                ", openview_pic=" + openview_pic +
                '}';
    }
}
