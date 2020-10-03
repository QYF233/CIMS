package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author kiko
 */
@RequestMapping("/area")
@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;

    @RequestMapping("/areaIndex")
    public String test() {
        return "area/areaIndex";
    }
}
