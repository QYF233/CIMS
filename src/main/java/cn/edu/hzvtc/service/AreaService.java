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
}
