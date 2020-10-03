package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author kiko
 */
@RequestMapping("/msg")
@Controller
public class MsgController {

    @Autowired
    private MsgService msgService;


    @RequestMapping("/msgIndex")
    public String test() {
        return "msg/msgIndex";
    }
}
