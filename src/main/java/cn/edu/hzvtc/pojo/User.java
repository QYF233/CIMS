package cn.edu.hzvtc.pojo;

import java.util.Date;

public class User {
    private Integer id;

    private String userName;

    private String userPassword;

    private Integer userOperatorId;

    private Date userOperatorTime;

    private Integer userType;

    private Integer userAreaId;

    public User(String userName, String userPassword, Integer userOperatorId, Date userOperatorTime, Integer userType, Integer userAreaId) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userOperatorId = userOperatorId;
        this.userOperatorTime = userOperatorTime;
        this.userType = userType;
        this.userAreaId = userAreaId;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public Integer getUserOperatorId() {
        return userOperatorId;
    }

    public void setUserOperatorId(Integer userOperatorId) {
        this.userOperatorId = userOperatorId;
    }

    public Date getUserOperatorTime() {
        return userOperatorTime;
    }

    public void setUserOperatorTime(Date userOperatorTime) {
        this.userOperatorTime = userOperatorTime;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getUserAreaId() {
        return userAreaId;
    }

    public void setUserAreaId(Integer userAreaId) {
        this.userAreaId = userAreaId;
    }
    private Area area;

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userOperatorId=" + userOperatorId +
                ", userOperatorTime=" + userOperatorTime +
                ", userType=" + userType +
                ", userAreaId=" + userAreaId +
                ", area=" + area +
                '}';
    }
}