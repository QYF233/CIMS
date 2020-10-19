package cn.edu.hzvtc.pojo;

import lombok.*;

/**
 * @author kiko
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserUnit {
    private Integer id;

    private Integer userId;

    private Integer unitId;

    private Integer userUnitDelState;
}