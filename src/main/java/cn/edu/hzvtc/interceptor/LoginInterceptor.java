package cn.edu.hzvtc.interceptor;

import cn.edu.hzvtc.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author kiko
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Boolean flg = true;
        /*获取请求的Url：去掉http:localhost:8080这部分剩下的*/
        String uri = request.getRequestURI();
        if (uri.contains("/login") || uri.contains("/commons/")) {
            return flg;
        }
        /*获取Session*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        /*判断session中是否有用户数据，如果有，则返回true，继续向下执行*/
        if (user != null) {
            if (uri.contains("/area")) {
                if (user.getUserType() != 1) {
                    flg = false;
                }
            }
            if (uri.contains("/unit")) {
                if (user.getUserType() != 2) {
                    flg = false;
                }
            }
            if (uri.contains("/msg")) {
                if (user.getUserType() != 3) {
                    flg = false;
                }
            }
        } else {
            flg = false;
        }
        if (!flg) {
            response.sendRedirect(request.getContextPath());
            return false;
        }

        return flg;
    }
}
