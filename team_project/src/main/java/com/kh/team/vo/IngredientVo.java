package com.kh.team.vo;

public class IngredientVo {
	private int lno;
	private int r_bno;
	private String i_name;
	private int i_amount;
	private String i_unit;
	private String i_address;
	
	public IngredientVo() {
		super();
	}

	public IngredientVo(int r_bno, String i_name, int i_amount) {
		super();
		this.r_bno = r_bno;
		this.i_name = i_name;
		this.i_amount = i_amount;
	}

	public IngredientVo(int lno, int r_bno, String i_name, int i_amount, String i_unit, String i_address) {
		super();
		this.lno = lno;
		this.r_bno = r_bno;
		this.i_name = i_name;
		this.i_amount = i_amount;
		this.i_unit = i_unit;
		this.i_address = i_address;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getR_bno() {
		return r_bno;
	}

	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_amount() {
		return i_amount;
	}

	public void setI_amount(int i_amount) {
		this.i_amount = i_amount;
	}

	public String getI_unit() {
		return i_unit;
	}

	public void setI_unit(String i_unit) {
		this.i_unit = i_unit;
	}

	public String getI_address() {
		return i_address;
	}

	public void setI_address(String i_address) {
		this.i_address = i_address;
	}

	@Override
	public String toString() {
		return "ingredientVo [lno=" + lno + ", r_bno=" + r_bno + ", i_name=" + i_name + ", i_amount=" + i_amount
				+ ", i_unit=" + i_unit + ", i_address=" + i_address + "]";
	}
}
