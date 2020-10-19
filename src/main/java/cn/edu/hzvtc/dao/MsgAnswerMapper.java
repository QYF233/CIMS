package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.MsgAnswer;
import java.util.List;

public interface MsgAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MsgAnswer record);

    MsgAnswer selectByPrimaryKey(Integer id);

    List<MsgAnswer> selectAll();

    int updateByPrimaryKey(MsgAnswer record);

    /**
     * 删除user绑定的信息
     * @param msgReceiveUserId
     * @return 删除条数
     */
    int deleteByUserKey(Integer msgReceiveUserId);

    int deleteByUserKeyList(List<Integer> ids);
}