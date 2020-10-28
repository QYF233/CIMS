package cn.edu.hzvtc.controller;


import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UnitService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.List;

/**
 * @author kiko
 */
@RequestMapping("/unit")
@Controller
public class UnitController {

    @Autowired
    private UnitService unitService;

    @RequestMapping("/unitIndex")
    public String index() {
        return "unit/unitIndex";
    }

    @RequestMapping("/unitType")
    public String unitType() {
        return "unit/unitType";
    }

    @RequestMapping("/unitManager")
    public String unitManager() {
        return "unit/unitManager";
    }

    @RequestMapping("/userManager")
    public String userManager() {
        return "unit/userManager";
    }

    /**
     * 获取列表
     *
     * @param session
     * @return
     */
    @RequestMapping("/unitTypes")
    @ResponseBody
    public ReturnMsg getUnitTypes(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        List<UnitType> unitTypes = unitService.getUnitTypesByAreaId(user.getUserAreaId());
        Long unitTypeCount = unitService.getCount(user.getUserAreaId());
        return ReturnMsg.success().add("unitTypes", unitTypes).add("unitTypeCount", unitTypeCount);
    }

    /**
     * 获取单个
     *
     * @param id
     * @return
     */
    @RequestMapping("/getUnitType")
    @ResponseBody
    public ReturnMsg getUnitType(@RequestParam(value = "id") Integer id) {
        UnitType unitType = unitService.getUnitTypeById(id);
        return ReturnMsg.success().add("unitType", unitType);
    }

    /**
     * 删除单位类型
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/unitType/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delUnitTypes(@PathVariable("id") Integer id) {
        if (unitService.delUnitType(id)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    /**
     * 新增单位类型
     * @param unitType
     * @param result
     * @param session
     * @return
     */
    @RequestMapping(value = "/unitType", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveUnitType(@Valid UnitType unitType, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        if (unitService.addUnitType(unitType)) {
            return ReturnMsg.success();
        }

        return ReturnMsg.fail();
    }

    /**
     * 修改单位类型
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/unitType/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@Valid UnitType unitType, @PathVariable("id") Integer id, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        unitType.setId(id);
        if (unitService.modifyUnitType(unitType)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /**
     * 判断用户名是否重复
     *
     * @return
     */
    @RequestMapping(value = "/validName", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg validName(@RequestParam(value = "unitTypeName") String unitTypeName, HttpSession session) {
        UnitType unitType = new UnitType();
        unitType.setUnitTypeName(unitTypeName);
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        System.out.println(loginUser.getUserAreaId());
        System.out.println(unitTypeName);
        UnitType unitType1 = unitService.getUnitTypeName(unitType);
        if (unitType1 != null) {
            return ReturnMsg.success().add("unitType",unitType1);
        } else {
            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
        }
    }

    /**
     * 获取单位管理列表
     * @param unitTypeId
     * @param unitName
     * @param pn
     * @param session
     * @return
     */
    @RequestMapping("/units")
    @ResponseBody
    public ReturnMsg getUnits(@RequestParam(value = "unitTypeId",defaultValue = "0") Integer unitTypeId,
                              @RequestParam(value = "unitName",defaultValue = "") String unitName,
                              @RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        PageHelper.startPage(pn, 5);
        List<Unit> units = unitService.getUnits(unitTypeId, unitName, user.getUserAreaId());
        PageInfo pageInfo = new PageInfo(units, 5);

        return ReturnMsg.success().add("pageInfo", pageInfo);
    }

    /**
     * 新增单位
     * @param unit
     * @return
     */
    @RequestMapping(value = "/unit", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveUnit(@Valid Unit unit) {
        System.out.println(unit.toString());
        if (unitService.addUnit(unit)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /**
     * 删除单位
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delUnit/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delUnit(@PathVariable("ids") String ids) {
        if (unitService.delUnit(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }
    /**
     * 修改前获取单位信息
     * @param id
     */
    @RequestMapping(value = "/getUnit", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getAreaAdmin(@RequestParam(value = "id") Integer id) {
        Unit unit = unitService.getUnit(id);
        if (unit != null) {
            return ReturnMsg.success().add("unit", unit);
        }
        return ReturnMsg.fail();
    }
    /**
     * 修改单位
     * @param unitTypeIdOld 原单位类型
     */
    @RequestMapping(value = "/unit/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@PathVariable("id") Integer id,
                            @RequestParam(value = "unitTypeIdOld") Integer unitTypeIdOld,
                            @Valid Unit unit) {
        if(unit.getUnitTypeId()==null){
            unit.setUnitTypeId(unitTypeIdOld);
        }
        if (unitService.modifyUnit(unit)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

}
