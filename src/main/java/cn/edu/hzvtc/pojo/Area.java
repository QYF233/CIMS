package cn.edu.hzvtc.pojo;

import java.util.List;

public class Area {
    private Integer id;

    private String areaName;

    private Integer areaType;

    private Integer areaParentId;

    private Integer areaSortNum;

    private Integer areaDelState;


    public Area() {
        super();
    }

    public Area(Integer id, String areaName, Integer areaType, Integer areaParentId, Integer areaSortNum) {
        this.id = id;
        this.areaName = areaName;
        this.areaType = areaType;
        this.areaParentId = areaParentId;
        this.areaSortNum = areaSortNum;
    }

    public Area(String areaName, Integer areaType, Integer areaParentId, Integer areaSortNum) {
        this.areaName = areaName;
        this.areaType = areaType;
        this.areaParentId = areaParentId;
        this.areaSortNum = areaSortNum;
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

    public Area parentArea;

    public Area getParentArea() {
        return parentArea;
    }

    public void setParentArea(Area parentArea) {
        this.parentArea = parentArea;
    }

    private String text;

    public Integer getAreaDelState() {
        return areaDelState;
    }

    public void setAreaDelState(Integer areaDelState) {
        this.areaDelState = areaDelState;
    }

    private List<Area> nodes;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<Area> getNodes() {
        return nodes;
    }

    public void setNodes(List<Area> nodes) {
        this.nodes = nodes;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", areaName='" + areaName + '\'' +
                ", areaType=" + areaType +
                ", areaParentId=" + areaParentId +
                ", areaSortNum=" + areaSortNum +
                ", text='" + text + '\'' +
                ", nodes=" + nodes +
                ", parentArea=" + parentArea +
                '}';
    }
}