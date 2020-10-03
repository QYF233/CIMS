package cn.edu.hzvtc.pojo;

public class Area {
    private Integer id;

    private String areaName;

    private Integer areaType;

    private Integer areaParentId;

    private Integer areaSortNum;

    public Area(String areaName, Integer areaType, Integer areaParentId, Integer areaSortNum) {
        this.areaName = areaName;
        this.areaType = areaType;
        this.areaParentId = areaParentId;
        this.areaSortNum = areaSortNum;
    }

    public Area() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public Integer getAreaType() {
        return areaType;
    }

    public void setAreaType(Integer areaType) {
        this.areaType = areaType;
    }

    public Integer getAreaParentId() {
        return areaParentId;
    }

    public void setAreaParentId(Integer areaParentId) {
        this.areaParentId = areaParentId;
    }

    public Integer getAreaSortNum() {
        return areaSortNum;
    }

    public void setAreaSortNum(Integer areaSortNum) {
        this.areaSortNum = areaSortNum;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaName='" + areaName + '\'' +
                ", areaType=" + areaType +
                ", areaParentId=" + areaParentId +
                ", areaSortNum=" + areaSortNum +
                '}';
    }
}