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
    public void test() {
//        userMapper.insert(new User("sysadmin","123456",1,new Date(),1,null));
//        userMapper.insert(new User("hzvtc","123456",1,new Date(),2,7));
//        userMapper.insert(new User("zhangsan","123456",1,new Date(),3,7));
    }

    @Test
    public void test_user() {
        User loginUser = userService.login("hzvtc", "123");
        System.out.println(loginUser.toString());

        /*User {
            id = 3, userName = 'hzvtc', userPassword = '123456', userOperatorId = 1, userOperatorTime = Sat Sep 26 19:50:
            42 CST 2020, userType = 2, userAreaId = 7, area = Area {
                id = 7, areaName = '杭州职业技术学院', areaType = 3, areaParentId = 4, areaSortNum = 1, parentArea = Area {
                    id = 4, areaName = '杭州市', areaType = 2, areaParentId = 1, areaSortNum = 1, parentArea = Area {
                        id = 1, areaName = '浙江省', areaType = 1, areaParentId = null, areaSortNum = 1, parentArea = null
                    }
                }
            }
        }*/

    }


}
