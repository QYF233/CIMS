package cn.edu.hzvtc.pojo;

import java.util.Date;

public class Msg {
    private Integer id;

    private String msgTitle;

    private String msdContent;

    private Integer msgType;

    private Integer msgSendUserId;

    private Date msgSendTime;

    public Msg(String msgTitle, String msdContent, Integer msgType, Integer msgSendUserId, Date msgSendTime) {
        this.msgTitle = msgTitle;
        this.msdContent = msdContent;
        this.msgType = msgType;
        this.msgSendUserId = msgSendUserId;
        this.msgSendTime = msgSendTime;
    }

    public Msg() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public String getMsdContent() {
        return msdContent;
    }

    public void setMsdContent(String msdContent) {
        this.msdContent = msdContent == null ? null : msdContent.trim();
    }

    public Integer getMsgType() {
        return msgType;
    }

    public void setMsgType(Integer msgType) {
        this.msgType = msgType;
    }

    public Integer getMsgSendUserId() {
        return msgSendUserId;
    }

    public void setMsgSendUserId(Integer msgSendUserId) {
        this.msgSendUserId = msgSendUserId;
    }

    public Date getMsgSendTime() {
        return msgSendTime;
    }

    public void setMsgSendTime(Date msgSendTime) {
        this.msgSendTime = msgSendTime;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "id=" + id +
                ", msgTitle='" + msgTitle + '\'' +
                ", msdContent='" + msdContent + '\'' +
                ", msgType=" + msgType +
                ", msgSendUserId=" + msgSendUserId +
                ", msgSendTime=" + msgSendTime +
                '}';
    }
}