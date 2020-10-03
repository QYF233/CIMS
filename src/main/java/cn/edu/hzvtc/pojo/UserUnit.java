package cn.edu.hzvtc.pojo;

public class UserUnit {
    private Integer id;

    private Integer userId;

    private Integer unitId;

    public UserUnit(Integer userId, Integer unitId) {
        this.userId = userId;
        this.unitId = unitId;
    }

    public UserUnit() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUnitId() {
        return unitId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    @Override
    public String toString() {
        return "UserUnit{" +
                "id=" + id +
                ", userId=" + userId +
                ", unitId=" + unitId +
                '}';
    }
}