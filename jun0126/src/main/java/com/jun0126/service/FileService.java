/*package com.jun0126.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jun0126.DAO.FileDAO;
import com.jun0126.VO.FileVO;





	@Service
	public class FileService {
		
		private static final String SAVE_PATH = "c:/upload";
		
		@Autowired
		private FileDAO fileDAO;
		
		public void insert( MultipartFile multiPartFile, FileVO fileVO ) {
			String orgFileName = multiPartFile.getOriginalFilename();
			String fileExtName = orgFileName.substring(orgFileName.lastIndexOf('.') + 1, orgFileName.length());
			String saveFileName = generateSaveFileName(fileExtName);
			Long fileSize = multiPartFile.getSize();

			// 파일 저장
			writeFile(multiPartFile, saveFileName);

			// DB에 저장
			fileVO.setOrgFileName(orgFileName);
			fileVO.setFileExtName(fileExtName);
			fileVO.setSaveFileName(saveFileName);
			fileVO.setFileSize(fileSize);
			
			Long no = fileDAO.insert( fileVO );
			FileVO vo = fileDAO.get( no );
			List<CommentsVO> cList = galleryDAO.getComments( vo.getGallery_no() );
			vo.setList(cList);
		}
		private void writeFile(MultipartFile multiPartFile, String saveFileName) {

			try {

				byte[] fileData = multiPartFile.getBytes();
				FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
				fos.write(fileData);
				fos.flush();
				fos.close();

			} catch (IOException ex) {}

		}
	}*/