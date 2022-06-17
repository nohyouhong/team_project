package com.kh.team.vo;

import java.util.Arrays;

public class IngredientListVo {
	private String[] i_names;
	private String[] i_amounts;
	
	public IngredientListVo() {
		super();
	}

	public IngredientListVo(String[] i_names, String[] i_amounts) {
		super();
		this.i_names = i_names;
		this.i_amounts = i_amounts;
	}

	public String[] getI_names() {
		return i_names;
	}

	public void setI_names(String[] i_names) {
		this.i_names = i_names;
	}

	public String[] getI_amounts() {
		return i_amounts;
	}

	public void setI_amounts(String[] i_amounts) {
		this.i_amounts = i_amounts;
	}

	@Override
	public String toString() {
		return "IngredientListVo [i_names=" + Arrays.toString(i_names) + ", i_amounts=" + Arrays.toString(i_amounts) + "]";
	}
}
