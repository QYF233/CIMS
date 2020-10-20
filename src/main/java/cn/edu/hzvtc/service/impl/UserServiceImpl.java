package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.MsgAnswerMapper;
import cn.edu.hzvtc.dao.MsgMapper;
import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.dao.UserUnitMapper;
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

    @Autowired
    private UserUnitMapper userUnitMapper;

    @Autowired
    private MsgAnswerMapper msgAnswerMapper;

    @Autowired
    private MsgMapper msgMapper;

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
     * @param user
     * @return
     */
    @Override
    public boolean addAreaAdmin(User user) {
        return userMapper.insert(user) > 0;
    }
}
