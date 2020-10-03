package cn.edu.hzvtc.service;

import cn.edu.hzvtc.pojo.User;

import java.util.List;

/**
 * 用户服务类接口
 */
public interface UserService {
    /**
     * 用登录
     */
    public User login(String username,String password);

    /**
     * 用获取用户密码
     */
    public void getPassword();

    /**
     * 用获取用户
     */
    public User getUser();

    /**
     * 用获取用户列表
     */
    public List getUserList();
}
