package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.UnitType;
import java.util.List;

public interface UnitTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UnitType record);

    UnitType selectByPrimaryKey(Integer id);

    List<UnitType> selectAll();

    int updateByPrimaryKey(UnitType record);

    List<UnitType> selectAllByType(Integer id);

    Long getCount(Integer id);

    int delUnitType(Integer id);

    int addUnitType(UnitType unitType);

    int modifyUnitType(UnitType unitType);

    UnitType selectName(UnitType unitType);
}