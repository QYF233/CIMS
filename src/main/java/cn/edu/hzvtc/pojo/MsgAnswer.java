package cn.edu.hzvtc.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
@Getter
@Setter
@ToString
@NoArgsConstructor
public class MsgAnswer {
    private Integer id;

    private Integer msgId;

    private Integer msgReceiveUserId;

    private Integer msgState;

    private Date msgAnswerTime;

    private String msgAnswerContent;

    private Integer msgVote;

    private String msgVoteReason;

    public MsgAnswer(Integer msgId, Integer msgReceiveUserId, Integer msgState, Date msgAnswerTime, String msgAnswerContent, Integer msgVote, String msgVoteReason) {
        this.msgId = msgId;
        this.msgReceiveUserId = msgReceiveUserId;
        this.msgState = msgState;
        this.msgAnswerTime = msgAnswerTime;
        this.msgAnswerContent = msgAnswerContent;
        this.msgVote = msgVote;
        this.msgVoteReason = msgVoteReason;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public Integer getMsgReceiveUserId() {
        return msgReceiveUserId;
    }

    public void setMsgReceiveUserId(Integer msgReceiveUserId) {
        this.msgReceiveUserId = msgReceiveUserId;
    }

    public Integer getMsgState() {
        return msgState;
    }

    public void setMsgState(Integer msgState) {
        this.msgState = msgState;
    }

    public Date getMsgAnswerTime() {
        return msgAnswerTime;
    }

    public void setMsgAnswerTime(Date msgAnswerTime) {
        this.msgAnswerTime = msgAnswerTime;
    }

    public String getMsgAnswerContent() {
        return msgAnswerContent;
    }

    public void setMsgAnswerContent(String msgAnswerContent) {
        this.msgAnswerContent = msgAnswerContent == null ? null : msgAnswerContent.trim();
    }

    public Integer getMsgVote() {
        return msgVote;
    }

    public void setMsgVote(Integer msgVote) {
        this.msgVote = msgVote;
    }

    public String getMsgVoteReason() {
        return msgVoteReason;
    }

    public void setMsgVoteReason(String msgVoteReason) {
        this.msgVoteReason = msgVoteReason == null ? null : msgVoteReason.trim();
    }

}