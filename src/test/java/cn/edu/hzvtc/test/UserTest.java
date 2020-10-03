package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.AreaMapper;
import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserTest {

    @Autowired
    public UserMapper userMapper;
    @Autowired
    public UserService userService;

    @Test
    public void test(){
//        userMapper.insert(new User("sysadmin","123456",1,new Date(),1,null));
//        userMapper.insert(new User("hzvtc","123456",1,new Date(),2,7));
//        userMapper.insert(new User("zhangsan","123456",1,new Date(),3,7));
    }

    @Test
    public void test_pwd(){
        User loginUser = userService.login("hzvtc","123");
        System.out.println(loginUser.getUserName());
        System.out.println(userMapper.selectPwdByName("hzvtc"));
    }
}
