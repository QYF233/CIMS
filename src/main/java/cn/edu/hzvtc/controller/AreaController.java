package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.service.AreaService;
import cn.edu.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kiko
 */
@RequestMapping("/area")
@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;
    @Autowired
    private UserService userService;

    @RequestMapping("/areaIndex")
    public String areaIndex() {
        return "area/areaIndex";
    }

    @RequestMapping("/areaManager")
    public String areaManager() {
        return "area/areaManager";
    }

    @RequestMapping("/areaAdminManager")
    public String areaAdminManager() {
        return "area/areaAdminManager";
    }

    /**
     * 查询树列表
     *
     * @return
     */
    @RequestMapping("/tree")
    @ResponseBody
    public ReturnMsg getTreeList() {
        List<Area> areas = areaService.getTree(0);
        return ReturnMsg.success().add("areas", areas);
    }

    /**
     * 添加
     *
     * @param area 添加的院校
     * @return
     */
    @RequestMapping(value = "/school", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg addSchool(@Valid Area area) {
        area.setAreaDelState(0);
        if (areaService.addSchool(area) == 1) {
            return ReturnMsg.success();
        } else {
            return ReturnMsg.fail().add("fieldErrors", "添加失败");
        }
    }

    /**
     * 修改
     *
     * @param area 修改的院校
     * @return
     */
    @RequestMapping(value = "/school/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg updateSchool(@Valid Area area) {
        area.setAreaDelState(0);
        if (areaService.updateSchool(area) == 1) {
            return ReturnMsg.success();
        } else {
            return ReturnMsg.fail().add("fieldErrors", "修改失败");
        }
    }

    /**
     * 删除
     *
     * @param id 院校id
     * @return
     */
    @RequestMapping(value = "/school/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg deleteSchool(@Valid Area area, @PathVariable("id") Integer id) {
        area.setId(id);
        area.setAreaDelState(1);
        if (areaService.updateSchool(area) == 1) {
            return ReturnMsg.success();
        } else {
            return ReturnMsg.fail().add("fieldErrors", "删除失败");
        }
    }

    /**
     * 获取院校列表
     * @param parentId 父级院校id
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg listByParentId(@RequestParam Integer parentId) {
        List<Area> areas;
        if (parentId == null) {
            areas = areaService.getTree(0);
        } else {
            areas = areaService.getTree(parentId);
        }
        return ReturnMsg.success().add("areaList", areas);
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg count() {
        Long userCount = userService.getCount();
        Long provinceCount = areaService.getCount(1);
        Long cityCount = areaService.getCount(2);
        Long schoolCount = areaService.getCount(3);
        return ReturnMsg.success().add("provinceCount", provinceCount)
                .add("cityCount", cityCount)
                .add("schoolCount", schoolCount)
                .add("userCount", userCount);
    }

}
