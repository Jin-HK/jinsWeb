package com.koreait.fcs.dao;

import java.util.List;
import java.util.Map;

import com.koreait.fcs.dto.NoticeDTO;

public interface NoticeDAO {
	
	//notice 리스트
	public List<NoticeDTO> noticeList(int beginRecord, int endRecord);
	
	//게시글 개수
	public int getTotalRecord();
	
	//게시글 추가
	public int insertNotice(String nTitle, String nContent, String mId);
	
	//게시글 보기
	public NoticeDTO noticeView(int nNo);
	
	//게시글 삭제
	public int noticeDelete(int nNo);
	
	//게시글 검색
	public List<NoticeDTO> queryNoticeList(Map<String, String> nMap);
	
	//검색된 게시글 개수
	public int getQueryRecord(Map<String, String> nMap);
	
	//조회수 증가
	public int updatenHit(int nNo);
}
