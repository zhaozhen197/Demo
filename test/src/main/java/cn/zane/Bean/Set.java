package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/19.
 */
public class Set {
    private Music music;
    private Voice voice;
    private FunctionOpen functionOpen;
    private Pic pic;
    private  Camera camera;
    private EarthCover  earthCover;
    private EarthCover openView;

//    private Hint hint;


    public EarthCover getEarthCover() {
        return earthCover;
    }

    public void setEarthCover(EarthCover earthCover) {
        this.earthCover = earthCover;
    }

    public EarthCover getOpenView() {
        return openView;
    }

    public void setOpenView(EarthCover openView) {
        this.openView = openView;
    }

    public Set(Music music, Voice voice, FunctionOpen functionOpen, Pic pic, Camera camera, EarthCover earthCover, EarthCover openView) {
        this.music = music;
        this.voice = voice;
        this.functionOpen = functionOpen;
        this.pic = pic;
        this.camera = camera;
        this.earthCover = earthCover;
        this.openView = openView;
    }

    public Set() {
    }

    public Set(Music music, Voice voice, FunctionOpen functionOpen, Pic pic, Camera camera) {
        this.music = music;
        this.voice = voice;
        this.functionOpen = functionOpen;
        this.pic = pic;
        this.camera = camera;
    }

    public Music getMusic() {
        return music;
    }

    public void setMusic(Music music) {
        this.music = music;
    }

    public Voice getVoice() {
        return voice;
    }

    public void setVoice(Voice voice) {
        this.voice = voice;
    }

    public FunctionOpen getFunctionOpen() {
        return functionOpen;
    }

    public void setFunctionOpen(FunctionOpen functionOpen) {
        this.functionOpen = functionOpen;
    }

    public Pic getPic() {
        return pic;
    }

    public void setPic(Pic pic) {
        this.pic = pic;
    }

    public Camera getCamera() {
        return camera;
    }

    public void setCamera(Camera camera) {
        this.camera = camera;
    }

    @Override
    public String toString() {
        return "Set{" +
                "music=" + music +
                ", voice=" + voice +
                ", functionOpen=" + functionOpen +
                ", pic=" + pic +
                ", camera=" + camera +
                ", earthCover=" + earthCover +
                ", openView=" + openView +
                '}';
    }
}
