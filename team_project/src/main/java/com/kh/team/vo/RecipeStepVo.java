package com.kh.team.vo;

import java.util.Arrays;

public class RecipeStepVo {
	private String r_content;
	private String r_picture;
	
	public RecipeStepVo() {
		super();
	}

	public RecipeStepVo(String r_content, String r_picture) {
		super();
		this.r_content = r_content;
		this.r_picture = r_picture;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_picture() {
		return r_picture;
	}

	public void setR_picture(String r_picture) {
		this.r_picture = r_picture;
	}

	@Override
	public String toString() {
		return "RecipeStepVo [r_content=" + r_content + ", r_picture=" + r_picture + "]";
	}
}	
