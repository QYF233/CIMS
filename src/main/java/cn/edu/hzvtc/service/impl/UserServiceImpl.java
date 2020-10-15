package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return null;
    }
}
