package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Area;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AreaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Area record);

    Area selectByPrimaryKey(Integer id);

    List<Area> selectAll();

    int updateByPrimaryKey(Area record);

    List<Area> selectAllForTree(int parentId);

//    int deleteByParentId(Integer id);

    //    List<Area> selectByType(int parentId);
    Long getCount(Integer type);
}