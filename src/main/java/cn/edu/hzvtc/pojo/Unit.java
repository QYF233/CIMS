package cn.edu.hzvtc.pojo;

public class Unit {
    private Integer id;

    private String unitName;

    private Integer unitTypeId;

    private Integer unitSortNum;

    public Unit(String unitName, Integer unitTypeId, Integer unitSortNum) {
        this.unitName = unitName;
        this.unitTypeId = unitTypeId;
        this.unitSortNum = unitSortNum;
    }

    public Unit() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }

    public Integer getUnitTypeId() {
        return unitTypeId;
    }

    public void setUnitTypeId(Integer unitTypeId) {
        this.unitTypeId = unitTypeId;
    }

    public Integer getUnitSortNum() {
        return unitSortNum;
    }

    public void setUnitSortNum(Integer unitSortNum) {
        this.unitSortNum = unitSortNum;
    }
}