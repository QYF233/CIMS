package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.MsgAnswerMapper;
import cn.edu.hzvtc.dao.MsgMapper;
import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.dao.UserUnitMapper;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserUnitMapper userUnitMapper;

    @Autowired
    private MsgAnswerMapper msgAnswerMapper;

    @Autowired
    private MsgMapper msgMapper;

    /**
     * 登录
     *
     * @return 登录用户信息
     */
    @Override
    public User login(String username, String password) {
        User user = new User();
        user = userMapper.selectPwdByName(username);
        return user;
    }

    /**
     * 用获取用户密码
     */
    @Override
    public void getPassword() {

    }



    /**
     * 用获取用户
     *
     * @param id 用户id
     * @return
     */
    @Override
    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    /**
     * 获取院校管理员列表
     *
     * @return 院校管理员用户列表
     */
    @Override
    public List<User> getAreaAdmins(Integer provinceId,Integer cityId,Integer schoolId,String userName) {
        userName = "%" + userName +"%";
        return userMapper.selectAreaAdmins(provinceId,cityId,schoolId,userName);
    }

    /**
     * 删除院校管理员账号
     *
     * @param ids id列表
     * @return true、false
     */
    @Override
    public boolean delAreaAdmin(String ids) {
        boolean result = false;
        if (ids.contains("-")) {
            /*批量删除*/
            List<Integer> delIds = new ArrayList<>();
            String[] strIds = ids.split("-");
            for (String strId : strIds) {
                delIds.add(Integer.parseInt(strId));
            }
            if (userMapper.deleteByPrimaryKeyList(delIds) > 0) {
                /*删除user_unit关联的信息*/
                userUnitMapper.deleteByUserKeyList(delIds);
                /*删除msg_info关联的信息*/
                msgMapper.deleteByUserKeyList(delIds);
                /*删除msg_answer关联的信息*/
                msgAnswerMapper.deleteByUserKeyList(delIds);
                result = true;
            }
        } else {
            /*单一删除*/
            Integer id = Integer.parseInt(ids);
            if (userMapper.selectByPrimaryKey(id) != null) {
                if (userMapper.deleteByPrimaryKey(id) > 0) {
                    userUnitMapper.deleteByUserKey(id);
                    msgMapper.deleteByUserKey(id);
                    msgAnswerMapper.deleteByUserKey(id);
                    result = true;
                }
            }
        }
        return result;
    }

    /**
     * 添加院校管理员
     *
     * @param user
     * @return
     */
    @Override
    public boolean addAreaAdmin(User user) {
        String pwd = DigestUtils.md5DigestAsHex(user.getUserPassword().getBytes());
        user.setUserPassword(pwd);
        return userMapper.insert(user) > 0;
    }

    /**
     * 修改院校管理员
     *
     * @param user
     * @return
     */
    @Override
    public boolean modifyAreaAdmin(User user) {
        return userMapper.updateById(user) > 0;
    }
    /**
     * 用获取用户
     *
     * @param username 用户姓名
     * @return
     */
    @Override
    public User getUserByUsername(String username) {

        return userMapper.selectPwdByName(username);
    }
    /**
     * 重置密码
     * @param id
     * @param pwd
     * @return
     */
    @Override
    public boolean passwordReset(Integer id, String pwd) {
        return userMapper.resetPwd(id,pwd) > 0;
    }
}
