package cn.edu.hzvtc.controller;


import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

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
    /**
     * 获取所有院校管理员信息
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

    @RequestMapping("/unitManager")
    public String unitManager() {
        return "unit/unitManager";
    }

    @RequestMapping("/userManager")
    public String userManager() {
        return "unit/userManager";
    }

/*    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg count() {
        Long unitTypeCount = unitService.getCount(3);
        return ReturnMsg.success().add("unitTypeCount", unitTypeCount);
    }*/
}
