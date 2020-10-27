package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.UnitMapper;
import cn.edu.hzvtc.dao.UnitTypeMapper;
import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kiko
 */
@Service
public class UnitServiceImpl implements UnitService {
    @Autowired
    private UnitMapper unitMapper;
    @Autowired
    private UnitTypeMapper unitTypeMapper;

    @Override
    public void index() {

    }

    @Override
    public List<UnitType> getUnitTypesByAreaId(Integer areaId) {
        return unitTypeMapper.selectAllByAreaId(areaId);
    }

    @Override
    public Long getCount(Integer id) {
        return unitTypeMapper.getCount(id);
    }

    @Override
    public Boolean delUnitType(Integer id) {
        return unitTypeMapper.delUnitType(id) > 0;
    }

    @Override
    public Boolean addUnitType(UnitType unitType) {
        return unitTypeMapper.addUnitType(unitType) > 0;
    }

    @Override
    public UnitType getUnitTypeById(Integer id) {
        return unitTypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean modifyUnitType(UnitType unitType) {
        return unitTypeMapper.modifyUnitType(unitType) > 0;
    }

    @Override
    public UnitType getUnitTypeName(UnitType unitType) {
        return unitTypeMapper.selectName(unitType);
    }

    @Override
    public List<Unit> getUnits(Integer unitTypeId, String unitName, Integer areaId) {
        unitName = "%" + unitName + "%";
        return unitMapper.getUnits(unitTypeId, unitName, areaId);
    }
}
