package cn.edu.hzvtc.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 封装Json数据和请求的状态
 */
public class ReturnMsg {
    private Integer code;   //状态码 100-成功 200-失败
    private String msg;     //提示消息
    private String target;  //连接地址

    //封装返回的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public static ReturnMsg success() {
        ReturnMsg result = new ReturnMsg();
        result.setCode(100);
        result.setMsg("处理成功！");
        return result;
    }

    public static ReturnMsg fail() {
        ReturnMsg result = new ReturnMsg();
        result.setCode(200);
        result.setMsg("处理失败！");
        return result;
    }

    public ReturnMsg add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

}