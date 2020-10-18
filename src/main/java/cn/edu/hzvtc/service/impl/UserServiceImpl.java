package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        User user = new User();
        user = userMapper.selectPwdByName(username);
        return user;
    }

    @Override
    public void getPassword() {

    }

    @Override
    public User getUser() {
        return null;
    }

    @Override
    public List<User> getUserList() {
        return null;
    }

    @Override
    public List<User> getAreaAdmins() {

        return userMapper.selectAreaAdmins();
    }

    @Override
    public boolean delAreaAdmin(String ids) {
        boolean result = false;
        if (ids.contains("-")) {
            List<Integer> delIds = new ArrayList<>();
            String[] strIds = ids.split("-");
            for (String strId : strIds) {
                delIds.add(Integer.parseInt(strId));
            }
            if (userMapper.deleteByPrimaryKeyList(delIds) > 0) {
                result = true;
            }
        } else {
            //单一删除
            Integer id = Integer.parseInt(ids);
            if (userMapper.selectByPrimaryKey(id) != null) {
                if (userMapper.deleteByPrimaryKey(id) > 0) {
                    result = true;
                }
            }
        }
        return result;
    }

}
