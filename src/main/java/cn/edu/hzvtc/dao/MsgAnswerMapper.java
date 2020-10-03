package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.MsgAnswer;
import java.util.List;

public interface MsgAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MsgAnswer record);

    MsgAnswer selectByPrimaryKey(Integer id);

    List<MsgAnswer> selectAll();

    int updateByPrimaryKey(MsgAnswer record);
}