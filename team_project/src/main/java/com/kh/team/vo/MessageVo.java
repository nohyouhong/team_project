package com.kh.team.vo;

import java.sql.Date;

public class MessageVo {
	private int mno;
	private String sender;
	private String receiver;
	private String message;
	private Date senddate;
	private Date opendate;
	
	public MessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageVo(String sender, String receiver, String message) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
	}

	public MessageVo(int mno, String sender, String receiver, String message, Date senddate, Date opendate) {
		super();
		this.mno = mno;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.senddate = senddate;
		this.opendate = opendate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public Date getOpendate() {
		return opendate;
	}

	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}

	@Override
	public String toString() {
		return "MessageVo [mno=" + mno + ", sender=" + sender + ", receiver=" + receiver + ", message=" + message
				+ ", senddate=" + senddate + ", opendate=" + opendate + "]";
	}
	
	
}
