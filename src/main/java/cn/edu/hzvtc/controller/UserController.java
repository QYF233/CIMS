package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import cn.edu.hzvtc.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author kiko
 */
@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public String test() {
        System.out.println("test*************************");
        return "unit/unitIndex";
    }


    @RequestMapping("/login")
    @ResponseBody
    public ReturnMsg login(@RequestParam(value = "userName", required = true) String userName,
                           @RequestParam(value = "userPassword", required = true) String userPassword,
                           HttpSession session) {

        //用户名密码为空，登录失败，返回登录页
        if (userName == null || userPassword == null) {
            return ReturnMsg.fail();
        }

        //从数据库中获取用户名和密码后进行判断
        User loginUser = userService.login(userName, userPassword);

        //登录成功
        if (loginUser != null) {
            if(loginUser.getUserPassword().equals(userPassword)){
                session.setAttribute("loginUser", loginUser);
                System.out.println(session.getId());

                ReturnMsg returnMsg = ReturnMsg.success();
                if (loginUser.getUserType() == 1) {
                    returnMsg.setTarget("area/areaIndex");
                } else if (loginUser.getUserType() == 2) {
                    returnMsg.setTarget("unit/unitIndex");
                } else if (loginUser.getUserType() == 3) {
                    returnMsg.setTarget("msg/msgIndex");
                } else {
                    returnMsg.setTarget("");
                }
                return returnMsg;
            }else {
                /*密码错误*/
                return ReturnMsg.fail().add("fieldErrors", loginUser);
            }

        } else {
            /*用户不存在*/
            return ReturnMsg.fail();
        }

    }
}
