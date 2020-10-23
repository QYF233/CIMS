package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.AreaMapper;
import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kiko
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<Area> getAreaList() {
        System.out.println("123");
        return null;
    }

    @Override
    public void insert() {
        System.out.println("123");
    }

    @Override
    public void index() {

    }

    @Override
    public List<Area> getTree(int parentId) {
        return areaMapper.selectAllForTree(parentId);
    }

    @Override
    public int addSchool(Area area) {
        return areaMapper.insert(area);
    }

    @Override
    public int updateSchool(Area area) {
        return areaMapper.updateByPrimaryKey(area);
    }

    @Override
    public Long getCount(Integer type) {
        return areaMapper.getCount(type);
    }
}
