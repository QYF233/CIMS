package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Msg;
import java.util.List;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Msg record);

    Msg selectByPrimaryKey(Integer id);

    List<Msg> selectAll();

    int updateByPrimaryKey(Msg record);
}