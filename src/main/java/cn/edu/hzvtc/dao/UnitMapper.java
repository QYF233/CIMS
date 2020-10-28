package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UnitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Unit record);

    Unit selectByPrimaryKey(Integer id);

    List<Unit> selectAll();

    int updateByPrimaryKey(Unit record);

    /**
     * 子查询
     * @param unitTypeId
     * @param unitName
     * @param areaId
     * @return
     */
    List<Unit> getUnits(@Param("unitTypeId") Integer unitTypeId,
                        @Param("unitName") String unitName,
                        @Param("areaId") Integer areaId);

    /**
     * 关联查询
     * @param unitTypeId
     * @param unitName
     * @param areaId
     * @return
     */
    List<Unit> getUnitsResult(@Param("unitTypeId") Integer unitTypeId,
                              @Param("unitName") String unitName,
                              @Param("areaId") Integer areaId);

    int deleteById(Integer id);

    int deleteByIdList(List<Integer> ids);

}