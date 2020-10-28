package cn.edu.hzvtc.service;

import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;

import java.util.List;

public interface UnitService {
    public void index();

    /**
     * 获取所有院校管理员信息
     *
     * @param id 院校id
     * @return
     */
    List<UnitType> getUnitTypesByAreaId(Integer id);

    Long getCount(Integer id);

    Boolean delUnitType(Integer id);

    Boolean addUnitType(UnitType unitType);

    UnitType getUnitTypeById(Integer id);

    Boolean modifyUnitType(UnitType unitType);

    UnitType getUnitTypeName(UnitType unitType);

    List<Unit> getUnits(Integer unitTypeId, String unitName, Integer areaId);

    Boolean delUnit(String id);

    Boolean addUnit(Unit unit);

    Unit getUnit(Integer id);

    Boolean modifyUnit(Unit unit);
}
