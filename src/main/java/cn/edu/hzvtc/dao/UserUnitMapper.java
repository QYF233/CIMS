package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.UserUnit;

import java.util.List;

public interface UserUnitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserUnit record);

    UserUnit selectByPrimaryKey(Integer id);

    List<UserUnit> selectAll();

    int updateByPrimaryKey(UserUnit record);

    int deleteByUserKey(Integer userId);

    int deleteByUserKeyList(List<Integer> ids);
}