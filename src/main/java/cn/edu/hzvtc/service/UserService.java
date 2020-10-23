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
     * @param username 用户姓名
     * @return
     */
    public User getUserByUsername(String username);

    /**
     * 用获取用户
     * @param id 用户id
     * @return
     */
    public User getUserById(Integer id);

    /**
     * 获取院校管理员列表
     *
     * @return 院校管理员用户列表
     */
    public List<User> getAreaAdmins(Integer provinceId,Integer cityId,Integer schoolId,String userName);

    /**
     * 删除院校管理员账号
     *
     * @param ids id列表
     * @return true、false
     */
    public boolean delAreaAdmin(String ids);


    /**
     * 添加院校管理员
     * @param user
     * @return
     */
    public boolean addAreaAdmin(User user);

    public boolean modifyAreaAdmin(User user);

    public boolean passwordReset(Integer id,String pwd);

    public Long getCount();
}
