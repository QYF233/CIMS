package cn.edu.hzvtc.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author kiko
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Unit {
    private Integer id;

    private String unitName;

    private Integer unitTypeId;

    private Integer unitSortNum;

    private UnitType unitType;

    private String unitTypeName;
}