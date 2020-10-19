package cn.edu.hzvtc.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;

    private String userName;

    private String userPassword;

    private Integer userOperatorId;

    /**
     * 类型转换器
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date userOperatorTime;

    private Integer userType;

    private Integer userAreaId;

    private Integer userDelState;

    private User userOperator;

    private Area area;


    public User(String userName, String userPassword, Integer userOperatorId, Date userOperatorTime, Integer userType, Integer userAreaId) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userOperatorId = userOperatorId;
        this.userOperatorTime = userOperatorTime;
        this.userType = userType;
        this.userAreaId = userAreaId;
    }

    public User(String userName, String userPassword, Integer userOperatorId, Date userOperatorTime, Integer userType, Integer userAreaId, User userOperator, Area area) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userOperatorId = userOperatorId;
        this.userOperatorTime = userOperatorTime;
        this.userType = userType;
        this.userAreaId = userAreaId;
        this.userOperator = userOperator;
        this.area = area;
    }

}