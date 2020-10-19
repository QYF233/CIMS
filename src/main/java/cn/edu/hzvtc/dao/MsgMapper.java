package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Msg;

import java.util.List;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Msg record);

    Msg selectByPrimaryKey(Integer id);

    List<Msg> selectAll();

    int updateByPrimaryKey(Msg record);

    /**
     * 删除user绑定的信息
     * @param msgSendUserId
     * @return 删除条数
     */
    int deleteByUserKey(Integer msgSendUserId);

    int deleteByUserKeyList(List<Integer> ids);
}