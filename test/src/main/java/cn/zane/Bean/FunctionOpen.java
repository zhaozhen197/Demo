package cn.zane.Bean;

/**
 * Created by ZZ on 2016/9/18.
 */
public class FunctionOpen {
    private  String planet;
    private  String viewchoose;
    private  String autoround;
    private  String doplace;
    private  String showtellone;
    private  String phone;
    private  String vrglass;
    private  String autorname;

    public FunctionOpen() {
    }

    public FunctionOpen(String planet, String viewchoose, String autoround, String doplace, String showtellone, String phone, String vrglass, String autorname) {
        this.planet = planet;
        this.viewchoose = viewchoose;
        this.autoround = autoround;
        this.doplace = doplace;
        this.showtellone = showtellone;
        this.phone = phone;
        this.vrglass = vrglass;
        this.autorname = autorname;
    }

    public String getPlanet() {
        return planet;
    }

    public void setPlanet(String planet) {
        this.planet = planet;
    }

    public String getViewchoose() {
        return viewchoose;
    }

    public void setViewchoose(String viewchoose) {
        this.viewchoose = viewchoose;
    }

    public String getAutoround() {
        return autoround;
    }

    public void setAutoround(String autoround) {
        this.autoround = autoround;
    }

    public String getDoplace() {
        return doplace;
    }

    public void setDoplace(String doplace) {
        this.doplace = doplace;
    }

    public String getShowtellone() {
        return showtellone;
    }

    public void setShowtellone(String showtellone) {
        this.showtellone = showtellone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getVrglass() {
        return vrglass;
    }

    public void setVrglass(String vrglass) {
        this.vrglass = vrglass;
    }

    public String getAutorname() {
        return autorname;
    }

    public void setAutorname(String autorname) {
        this.autorname = autorname;
    }

    @Override
    public String toString() {
        return "FunctionOpen{" +
                "planet='" + planet + '\'' +
                ", viewchoose='" + viewchoose + '\'' +
                ", autoround='" + autoround + '\'' +
                ", doplace='" + doplace + '\'' +
                ", showtellone='" + showtellone + '\'' +
                ", phone='" + phone + '\'' +
                ", vrglass='" + vrglass + '\'' +
                ", autorname='" + autorname + '\'' +
                '}';
    }
}
