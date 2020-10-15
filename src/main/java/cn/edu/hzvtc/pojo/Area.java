package cn.edu.hzvtc.pojo;

import lombok.*;

import java.util.List;
/**
 * @author kiko
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Area {
    private Integer id;

    private String areaName;

    private Integer areaType;

    private Integer areaParentId;

    private Integer areaSortNum;

    private Integer areaDelState;

    public Area parentArea;

    private String text;

    private List<Area> nodes;

    public Area(String areaName, Integer areaType, Integer areaParentId, Integer areaSortNum) {
        this.areaName = areaName;
        this.areaType = areaType;
        this.areaParentId = areaParentId;
        this.areaSortNum = areaSortNum;
    }

    public Area(Integer id, String areaName, Integer areaType, Integer areaParentId, Integer areaSortNum, Integer areaDelState) {
        this.id = id;
        this.areaName = areaName;
        this.areaType = areaType;
        this.areaParentId = areaParentId;
        this.areaSortNum = areaSortNum;
        this.areaDelState = areaDelState;
    }
}