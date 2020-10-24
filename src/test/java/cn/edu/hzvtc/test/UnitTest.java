package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.UnitMapper;
import cn.edu.hzvtc.dao.UnitTypeMapper;
import cn.edu.hzvtc.dao.UserMapper;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UnitTest {

    @Autowired
    public UserMapper userMapper;
    @Autowired
    public UserService userService;
@Autowired
public UnitTypeMapper unitTypeMapper;

    @Test
    public void test() {
        UnitType unitType = new UnitType();
        unitType.setUnitTypeName("测试测试");
        unitType.setUnitTypeAreaId(7);
        UnitType unitType1 = unitTypeMapper.selectName(unitType);
        System.out.println(unitType1);
    }

}
