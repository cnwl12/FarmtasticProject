package com.itwillbs.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dao.SellerDAO;

@Service
public class SellerService {
	
	 @Autowired
	    private SellerDAO sellerDAO;
	 	//매출관리에 판매자별 총매출 불러오기 위한 구문
	    public List<Map<String, Object>> getSellers() {
	        return sellerDAO.getSellers();
	    }


		public void itemInsert(HashMap<String, String> itemList, List<MultipartFile> files,HttpSession session) {
			System.out.println("itemInsert 확인!!!");
			
			try {
				// 첨부파일 올라갈 물리적 경로 
				String uploadPath = session.getServletContext().getRealPath("/resources/upload");
				
				System.out.println(uploadPath);
				
				for (int i = 0; i < files.size(); i++) {
                    MultipartFile file = files.get(i);
                    if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
                        String fileName = file.getOriginalFilename(); // 파일 원래 이름
                        String fileExtension = FilenameUtils.getExtension(fileName); // 확장자

                        String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                        String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                        String filePath = uploadPath + "/" + storedFileName;
                        
                        System.out.println("filePath : " + filePath);
                        
                        // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
                        String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

                        // 임시경로에서 filePath로 파일이동 
                        File dest = new File(filePath);
                        file.transferTo(dest);
                        
                        // 사진 업로드 완료 //
						/* 컬럼 이름
						 * item_mainImg item_img1 item_img2
						 */
                        
                        // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
                        // 사진 정보의 경로를 저장
                        itemList.put("item_mainImg", saveFileName);

                        // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
                	}
                }
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			
			// 파일 자체는(try안에서 저장됨) //  파일 이름만 서비스에서 itemList로 저장
	        sellerDAO.itemInsert(itemList); // DB저장 코드 
			
		}


		public List<Map<String, Object>> getItems() {
			
			System.out.println("서비스 오나요");
			return sellerDAO.getItems();
		}
		
		//정산 위한 판매자별 월별 매출리스트
		public List<Map<String, Object>> getSales() {
			 return sellerDAO.getSales();
		}
		 public void settlementStatus(List<String> sellerNums) {
			 System.out.println("SellerService settlementStatus 확인!");
		        sellerDAO.settlementStatus(sellerNums);
		 }	

	    

}
