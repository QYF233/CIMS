package cn.edu.hzvtc.service;

import cn.edu.hzvtc.pojo.User;

import java.util.List;

/**
 * 用户服务类接口
 */
public interface UserService {
    /**
     * 登录
     *
     * @return 登录用户信息
     */
    public User login(String username, String password);

    /**
     * 用获取用户密码
     */
    public void getPassword();

    /**
     * 用获取用户
     *
     * @return 登录用户
     */
    public User getUser();

    /**
     * 用获取用户列表
     *
     * @return 用户列表
     */
    public List<User> getUserList();

    /**
     * 获取院校管理员列表
     *
     * @return 院校管理员用户列表
     */
    public List<User> getAreaAdmins();

    /**
     * 删除院校管理员账号
     *
     * @param ids id列表
     * @return true、false
     */
    public boolean delAreaAdmin(String ids);
}
