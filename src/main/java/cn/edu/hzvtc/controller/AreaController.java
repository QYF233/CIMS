package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/tree")
    @ResponseBody
    public ReturnMsg getTreeList(){
        List<Area> areas = areaService.getTree(0);
        return ReturnMsg.success().add("areas",areas);
    }
}
