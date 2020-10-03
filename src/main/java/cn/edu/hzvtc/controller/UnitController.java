package cn.edu.hzvtc.controller;


import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
    public String index(HttpSession session, Map<String, Object> map) {
        User loginUser = (User) session.getAttribute("loginUser");
        Integer userAreaId = loginUser.getUserAreaId();

        map.put("loginUserName", loginUser.getUserName());
        return "unit/unitIndex";
    }
}
