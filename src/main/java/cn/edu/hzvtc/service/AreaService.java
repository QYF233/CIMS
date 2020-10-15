package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.AreaMapper;
import cn.edu.hzvtc.pojo.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kiko
 */
@Service
public interface AreaService {


    public List<Area> getAreaList();

    public void insert();

    public void index();

    public List<Area> getTree(int parentId);

    public int addSchool(Area area);

    public int updateSchool(Area area);

    public int deleteSchool(int areaId);
}
