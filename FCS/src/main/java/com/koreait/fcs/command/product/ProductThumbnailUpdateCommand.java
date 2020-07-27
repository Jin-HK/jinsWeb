package com.koreait.fcs.command.product;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ProductDAO;

public class ProductThumbnailUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		int pNo = Integer.parseInt(mr.getParameter("pNo"));
		String pName = mr.getParameter("pName");
		int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
		int pCategory = Integer.parseInt(mr.getParameter("pCategory"));
		int pGender = Integer.parseInt(mr.getParameter("pGender"));
		int pStock1 = Integer.parseInt(mr.getParameter("pStock1"));	// s사이즈
		int pStock2 = Integer.parseInt(mr.getParameter("pStock2"));	// m사이즈
		int pStock3 = Integer.parseInt(mr.getParameter("pStock3"));	// l사이즈
		String pCompany = mr.getParameter("pCompany");
		String pDescription = mr.getParameter("pDescription");
			
		MultipartFile pThumbnail = mr.getFile("pThumbnail");
		
		String originpFilename = pThumbnail.getOriginalFilename();
		
		// originFileName 에서 확장자 분리
		String extName2 = originpFilename.substring(originpFilename.lastIndexOf('.') + 1);	// 상세이미지 확장자
		
		// 저장할 파일 이름 만들기 / 업로드 / 파일이름 DB에 저장
		String saveFilename2 = null;	// 상세이미지
		try {
			
			// 1) 저장할 파일 이름 만들기
			// 파일명 중복 방지 대책으로 서버에 저장할 파일의 이름에 업로드 시간을 추가한다.
			// 서버에 저장될 파일명 : 원래파일명_업로드시간.확장자
			// 원래파일명 : originFilename.substring(0, originFileName.lastIndexOf('.'))
			// 업로드시간 : System.currentTimeMillis()
			saveFilename2 = originpFilename.substring(0, originpFilename.lastIndexOf('.')) + "_" + System.currentTimeMillis() + "." + extName2;
			
			// 2) 업로드
			// 2-1) 파일이 저장될 서버 내 경로(/resources/storage)를 알아낸다.
			
			String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");
			
			// 2-2) /resources/storage 경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
			// new File(경로) : 경로로 디렉토리만 사용되면 디렉토리로 인식한다.
			File directory = new File(realPath);
			if(!directory.exists()) {
				directory.mkdirs();	// mkdirs : 하위 디렉토리를 모두 만든다
			}
			
			// 2-3) 서버에 저장할 파일을 만든다.
			File saveFile2 = new File(realPath, saveFilename2);	// 상세이미지
			
			// 2-4) 업로드한다.
			pThumbnail.transferTo(saveFile2);
			
			// 3) DB에 저장하기
			// iWriter, iTitle, iContent, saveFilename
			ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
			
			
			pDAO.productThumbnailUpdate(pName, pPrice, pCategory, pGender, pCompany, saveFilename2, pDescription, pStock1, pStock2, pStock3, pNo);
		
			model.addAttribute("pCategory", pCategory);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		

	}

}
