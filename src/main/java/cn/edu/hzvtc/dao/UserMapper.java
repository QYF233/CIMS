package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByPrimaryKeyList(List<Integer> ids);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    User selectPwdByName(String name);

    User selectUserByName(String name);

    List<User> selectAreaAdmins();
}