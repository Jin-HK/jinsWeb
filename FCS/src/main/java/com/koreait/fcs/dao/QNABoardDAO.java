package com.koreait.fcs.dao;

import java.util.List;

import com.koreait.fcs.dto.QNABoardDTO;

public interface QNABoardDAO {
	
	//qna리스트
	public List<QNABoardDTO> qnaBoardList(int beginRecord, int endRecord, int pNo);
	
	//게시글 개수 
	public int getTotalRecord(int pNo);
	
	//게시글 작성
	public int qnaBoardInsert(int pNo, String qTitle, String qPw, String qContent, String mId);
	
	//게시글 조회
	public QNABoardDTO selectByqNo(int qNo);
	
	//게시글 삭제
	public int qnaBoardDelete(int qNo, int qDelete);
	
	//qStep 증가
	public int updateqStep(int qRef);
	
	//답글 작성
	public int insertReply(int pNo, String qTitle, String qPw, String qContent, String mId, int qRef, int qStep, int qDepth);
	
	//내 게시글 보기
	public List<QNABoardDTO>  qnaMyBoardList(int beginRecord, int endRecord, int pNo, String mId);
	
	//내 게시글 개수
	public int getMyTotalRecord(int pNo, String mId);
	
}
