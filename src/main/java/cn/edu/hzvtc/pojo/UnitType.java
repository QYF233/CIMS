package cn.edu.hzvtc.pojo;

public class UnitType {
    private Integer id;

    private String unitTypeName;

    private Integer unitTypeSortNum;

    private Integer unitTypeAreaId;

    public UnitType(String unitTypeName, Integer unitTypeSortNum, Integer unitTypeAreaId) {
        this.unitTypeName = unitTypeName;
        this.unitTypeSortNum = unitTypeSortNum;
        this.unitTypeAreaId = unitTypeAreaId;
    }

    public UnitType() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUnitTypeName() {
        return unitTypeName;
    }

    public void setUnitTypeName(String unitTypeName) {
        this.unitTypeName = unitTypeName == null ? null : unitTypeName.trim();
    }

    public Integer getUnitTypeSortNum() {
        return unitTypeSortNum;
    }

    public void setUnitTypeSortNum(Integer unitTypeSortNum) {
        this.unitTypeSortNum = unitTypeSortNum;
    }

    public Integer getUnitTypeAreaId() {
        return unitTypeAreaId;
    }

    public void setUnitTypeAreaId(Integer unitTypeAreaId) {
        this.unitTypeAreaId = unitTypeAreaId;
    }

    @Override
    public String toString() {
        return "UnitType{" +
                "id=" + id +
                ", unitTypeName='" + unitTypeName + '\'' +
                ", unitTypeSortNum=" + unitTypeSortNum +
                ", unitTypeAreaId=" + unitTypeAreaId +
                '}';
    }
}