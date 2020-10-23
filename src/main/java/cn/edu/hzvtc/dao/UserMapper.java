package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByPrimaryKeyList(List<Integer> ids);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    User selectPwdByName(@Param("username") String name);

    User selectUserByNameAndPwd(@Param("username") String name, @Param("password") String password);

    List<User> selectAreaAdmins(@Param("provinceId") Integer provinceId,
                                @Param("cityId") Integer cityId,
                                @Param("schoolId") Integer schoolId,
                                @Param("userName") String userName);

    User getUserById(Integer id);

    int updateById(User record);

    int resetPwd(@Param("id") Integer id, @Param("pwd") String pwd);

    Long getCount();
}