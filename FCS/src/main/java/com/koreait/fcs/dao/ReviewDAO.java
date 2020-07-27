package com.koreait.fcs.dao;

import java.util.List;

import com.koreait.fcs.dto.ReviewDTO;

public interface ReviewDAO {
	
	//review 리스트
	public List<ReviewDTO> reviewList(int beginRecord, int endRecord, int pNo);
	public List<ReviewDTO> reviewListWithImage(int beginRecord, int endRecord, int pNo);
	
	//리뷰 개수 
	public int getTotalRecord(int pNo);
	public int getTotalRecordWithImage(int pNo);
	
	//리뷰 등록 첨부파일x
	public int reviewInsert(int pNo, String rTitle, String rContent, String mId, int rScore);

	//리뷰 등록 첨부파일o
	public int reviewInsertWithImage(int pNo, String rTitle, String rContent, String mId, int rScore, String saveFilename);
	
	//리뷰 삭제
	public int reviewDelete(int rNo);
	
	//리뷰 작성 유무 확인
	public int InsertCheck(int pNo, String mId);
}
