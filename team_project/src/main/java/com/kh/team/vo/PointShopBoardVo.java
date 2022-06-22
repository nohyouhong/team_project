package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class PointShopBoardVo {
	private int p_bno;
	private String p_title;
	private String p_explain;
	private int deliverycharge;
	private String userid;
	private Date p_regdate;
	private int p_viewcnt;
	private float p_avgrating;
	private String sellstate;
	private String purchaseplace;
	private String p_picture;
	private String[] p_pictures;
	private String[] p_tags;
	
	public PointShopBoardVo() {
		super();
	}

	public PointShopBoardVo(String p_title, String p_explain, int deliverycharge, String userid, String sellstate,
			String purchaseplace) {
		super();
		this.p_title = p_title;
		this.p_explain = p_explain;
		this.deliverycharge = deliverycharge;
		this.userid = userid;
		this.sellstate = sellstate;
		this.purchaseplace = purchaseplace;
	}

	public PointShopBoardVo(int p_bno, String p_title, String p_explain, int deliverycharge, String userid,
			Date p_regdate, int p_viewcnt, float p_avgrating, String sellstate, String purchaseplace, String p_picture,
			String[] p_pictures, String[] p_tags) {
		super();
		this.p_bno = p_bno;
		this.p_title = p_title;
		this.p_explain = p_explain;
		this.deliverycharge = deliverycharge;
		this.userid = userid;
		this.p_regdate = p_regdate;
		this.p_viewcnt = p_viewcnt;
		this.p_avgrating = p_avgrating;
		this.sellstate = sellstate;
		this.purchaseplace = purchaseplace;
		this.p_picture = p_picture;
		this.p_pictures = p_pictures;
		this.p_tags = p_tags;
	}

	public int getP_bno() {
		return p_bno;
	}

	public void setP_bno(int p_bno) {
		this.p_bno = p_bno;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_explain() {
		return p_explain;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}

	public int getDeliverycharge() {
		return deliverycharge;
	}

	public void setDeliverycharge(int deliverycharge) {
		this.deliverycharge = deliverycharge;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public int getP_viewcnt() {
		return p_viewcnt;
	}

	public void setP_viewcnt(int p_viewcnt) {
		this.p_viewcnt = p_viewcnt;
	}

	public float getP_avgrating() {
		return p_avgrating;
	}

	public void setP_avgrating(float p_avgrating) {
		this.p_avgrating = p_avgrating;
	}

	public String getSellstate() {
		return sellstate;
	}

	public void setSellstate(String sellstate) {
		this.sellstate = sellstate;
	}

	public String getPurchaseplace() {
		return purchaseplace;
	}

	public void setPurchaseplace(String purchaseplace) {
		this.purchaseplace = purchaseplace;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public String[] getP_pictures() {
		return p_pictures;
	}

	public void setP_pictures(String[] p_pictures) {
		this.p_pictures = p_pictures;
	}
	
	public String[] getP_tags() {
		return p_tags;
	}

	public void setP_tags(String[] p_tags) {
		this.p_tags = p_tags;
	}

	@Override
	public String toString() {
		return "PointShopBoardVo [p_bno=" + p_bno + ", p_title=" + p_title + ", p_explain=" + p_explain
				+ ", deliverycharge=" + deliverycharge + ", userid=" + userid + ", p_regdate=" + p_regdate
				+ ", p_viewcnt=" + p_viewcnt + ", p_avgrating=" + p_avgrating + ", sellstate=" + sellstate
				+ ", purchaseplace=" + purchaseplace + ", p_picture=" + p_picture + ", p_pictures="
				+ Arrays.toString(p_pictures) + ", p_tags=" + Arrays.toString(p_tags) + "]";
	}
}
