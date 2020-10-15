package cn.edu.hzvtc.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
/**
 * @author kiko
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Msg {
    private Integer id;

    private String msgTitle;

    private String msdContent;

    private Integer msgType;

    private Integer msgSendUserId;

    private Date msgSendTime;


}