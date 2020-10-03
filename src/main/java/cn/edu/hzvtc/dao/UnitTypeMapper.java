package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.UnitType;
import java.util.List;

public interface UnitTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UnitType record);

    UnitType selectByPrimaryKey(Integer id);

    List<UnitType> selectAll();

    int updateByPrimaryKey(UnitType record);
}