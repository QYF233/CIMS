package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

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

    /**
     * 登录
     */
    @RequestMapping("/login")
    @ResponseBody
    public ReturnMsg login(@RequestParam(value = "userName", required = true) String userName,
                           @RequestParam(value = "userPassword", required = true) String userPassword,
                           HttpSession session) {

        //用户名密码为空，登录失败，返回登录页
        if (userName == null || userPassword == null) {
            return ReturnMsg.fail();
        }
        String pwd = DigestUtils.md5DigestAsHex(userPassword.getBytes());
        //从数据库中获取用户名和密码后进行判断
        User loginUser = userService.login(userName, pwd);

        //登录成功
        if (loginUser != null) {
            if (loginUser.getUserPassword().equals(pwd)) {
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
            } else {
                /*密码错误*/
                return ReturnMsg.fail().add("fieldErrors", "密码错误");
            }
        } else {
            /*用户不存在*/
            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
        }
    }

    /**
     * 获取登录用户信息
     */
    @RequestMapping("/loginUser")
    @ResponseBody
    public ReturnMsg loginUser(HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        System.out.println("****************" + session.getId() + "********" + loginUser.toString());

        /*添加所有地区*/
        Area area = loginUser.getArea();
        String areaAll = "";
        if (area != null) {
            do {
                System.out.println(area.getAreaName());
                areaAll = area.getAreaName() + " " + areaAll;
                area = area.getParentArea();
            } while (area != null);
            /*清除最后一个空格*/
            areaAll = areaAll.substring(0, areaAll.length() - 1);
        }

        return ReturnMsg.success().add("loginUser", loginUser).add("areaAll", areaAll);
    }

    /**
     * 注销
     */
    @RequestMapping("/logout")
    @ResponseBody
    public ReturnMsg logout(HttpSession session) {
        /*清楚session*/
        session.invalidate();
        /*重定向到登录页面的跳转方法*/
        ReturnMsg returnMsg = ReturnMsg.success();
        returnMsg.setTarget("../");
        return returnMsg;
    }

    /**
     * 查询院校列表
     *
     * @param pn 页码
     * @return
     */
    @RequestMapping("/areaAdmins")
    @ResponseBody
    public ReturnMsg getAreaAdmins(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //引入PageHelper分页插件
        //在查询之前只需要传入页码以及每页的大小
        PageHelper.startPage(pn, 5);
        //startPage方法紧跟第一个select查询就是一个分页查询
        List<User> areaAdmins = userService.getAreaAdmins();
        //使用PageInfo包装查询结果，封装了分页信息和查询出的数据，只需将pageInfo交给页面即可
        PageInfo pageInfo = new PageInfo(areaAdmins, 5);

        return ReturnMsg.success().add("pageInfo", pageInfo);
    }

    /**
     * 删除院校管理员及其关联的他表信息
     *
     * @param ids 管理员id
     * @return
     */
    @RequestMapping(value = "/areaAdmin/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delAreaAdmin(@PathVariable("ids") String ids) {
        if (userService.delAreaAdmin(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /**
     * 修改前获取用户信息
     *
     * @param id 查询的用户id
     * @return
     */
    @RequestMapping(value = "/areaAdmin", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getAreaAdmin(@RequestParam(value = "id") Integer id) {
        User areaAdmin = userService.getUserById(id);
        if (areaAdmin != null) {
            return ReturnMsg.success().add("areaAdmin", areaAdmin);
        }
        return ReturnMsg.fail();
    }

    /**
     * 新增院校管理员
     *
     * @param user
     * @param result
     * @param session
     * @return
     */
    @RequestMapping(value = "/areaAdmin", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg save(@Valid User user, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        user.setUserOperatorId(loginUser.getId());
        user.setUserOperatorTime(new Date());
        user.setUserType(2);
        user.setUserDelState(0);
        String pwd = DigestUtils.md5DigestAsHex(user.getUserPassword().getBytes());
        user.setUserPassword(pwd);
        System.out.println(user.toString());
        if (userService.addAreaAdmin(user)) {
            return ReturnMsg.success();
        }

        return ReturnMsg.fail();
    }

    /**
     * 修改院校管理员信息
     *
     * @param areaAdminId 管理员id
     * @param user        修改信息
     * @param result
     * @param session
     * @return
     */
    @RequestMapping(value = "/areaAdmin/{areaAdminId}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@PathVariable("areaAdminId") Integer areaAdminId, @Valid User user, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        user.setId(areaAdminId);
        user.setUserOperatorId(loginUser.getId());
        user.setUserOperatorTime(new Date());
        user.setUserType(2);
        user.setUserDelState(0);
        System.out.println(areaAdminId + " 需要修改：" + user.toString());
        if (userService.modifyAreaAdmin(user)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    @RequestMapping(value = "/validName", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg validName(@RequestParam(value = "username") String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return ReturnMsg.success().add("user", user);
        } else {
            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
        }
    }

    @RequestMapping(value = "/passwordReset", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg passwordReset(@RequestParam(value = "id") Integer id) {
        String pwd = DigestUtils.md5DigestAsHex("123456".getBytes());
        System.out.println();
        if (userService.passwordReset(id,pwd)) {
            return ReturnMsg.success();
        } else {
            return ReturnMsg.fail();
        }
    }

}
