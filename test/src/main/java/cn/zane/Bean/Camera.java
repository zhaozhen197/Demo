package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/15.
 */
public class Camera {
    private  String cameraPattern;//相机型号
    private String cameraShot ;//镜头型号
    private  String yunTaiType;//云台型号
    private  String ligthRing;//光圈大小

    public String getCameraPattern() {
        return cameraPattern;
    }

    public void setCameraPattern(String cameraPattern) {
        this.cameraPattern = cameraPattern;
    }

    public String getCameraShot() {
        return cameraShot;
    }

    public void setCameraShot(String cameraShot) {
        this.cameraShot = cameraShot;
    }

    public String getYunTaiType() {
        return yunTaiType;
    }

    public void setYunTaiType(String yunTaiType) {
        this.yunTaiType = yunTaiType;
    }

    public String getLigthRing() {
        return ligthRing;
    }

    public void setLigthRing(String ligthRing) {
        this.ligthRing = ligthRing;
    }

    public Camera() {
    }

    public Camera(String cameraPattern, String cameraShot, String yunTaiType, String ligthRing) {
        this.cameraPattern = cameraPattern;
        this.cameraShot = cameraShot;
        this.yunTaiType = yunTaiType;
        this.ligthRing = ligthRing;
    }

    @Override
    public String toString() {
        return "Camera{" +
                "cameraPattern='" + cameraPattern + '\'' +
                ", cameraShot='" + cameraShot + '\'' +
                ", yunTaiType='" + yunTaiType + '\'' +
                ", ligthRing='" + ligthRing + '\'' +
                '}';
    }
}
