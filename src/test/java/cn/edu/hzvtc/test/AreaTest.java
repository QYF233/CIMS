package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.AreaMapper;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.service.AreaService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class AreaTest {

    @Autowired
    public AreaMapper areaMapper;


    @Test
    public void addData(){
        areaMapper.insert(new Area("浙江省",1,null,1));
        areaMapper.insert(new Area("江苏省",1,null,2));
        areaMapper.insert(new Area("安徽省",1,null,3));
        areaMapper.insert(new Area("杭州市",2,1,1));
        areaMapper.insert(new Area("宁波市",2,1,2));
        areaMapper.insert(new Area("温州市",2,1,3));
        areaMapper.insert(new Area("杭州职业技术学院",3,4,1));
        areaMapper.insert(new Area("浙江大学",3,4,2));
        areaMapper.insert(new Area("中国计量大学",3,4,3));
        areaMapper.insert(new Area("宁波大学",3,5,1));
        areaMapper.insert(new Area("宁波职业技术学院",3,5,2));
        areaMapper.insert(new Area("温州职业技术学院",3,6,3));
        areaMapper.insert(new Area("南京市",2,2,1));
        areaMapper.insert(new Area("苏州市",2,2,2));
        areaMapper.insert(new Area("南京大学",3,13,1));
        areaMapper.insert(new Area("苏州大学",3,14,1));
    }

    @Test
    public void testTree(){
        System.out.println(areaMapper.selectAllForTree(0));
    }
}
