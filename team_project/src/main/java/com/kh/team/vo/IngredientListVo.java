package com.kh.team.vo;

import java.util.Arrays;

public class IngredientListVo {
	private String[] i_names;
	private int[] i_amounts;
	
	public IngredientListVo() {
		super();
	}

	public IngredientListVo(String[] i_names, int[] i_amounts) {
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

	public int[] getI_amounts() {
		return i_amounts;
	}

	public void setI_amounts(int[] i_amounts) {
		this.i_amounts = i_amounts;
	}

	@Override
	public String toString() {
		return "IngredientListVo [i_names=" + Arrays.toString(i_names) + ", i_amounts=" + Arrays.toString(i_amounts) + "]";
	}
}
