package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.DeclareVo;

public interface DeclareService {

	//관리자 조치
		//(리포터는 신고한사람에게 조치햇다고 알릴때 쓰는데 여기에 할까 메세지다오에할까)
		//(마찬가지 범인에게도 신고누적으로 경고메시지 보내야하는데 고민해보자)
	
	//레시피 댓글
	public List<DeclareVo> recipeCommentDeclareList(); // 관리자가 보는 모든신고
	public List<DeclareVo> recipeCommentDeclareListByCriminal(String criminal); //한사람이 당한 신고리스트
	public boolean insertRecipeCommentDeclare(DeclareVo declareVo); //신고접수
	
}
