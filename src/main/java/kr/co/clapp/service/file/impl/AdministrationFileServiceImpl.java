package kr.co.clapp.service.file.impl;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.dao.AdministrationFileDAO;
import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.clapp.service.file.AdministrationFileService;
import kr.co.digigroove.commons.entities.SavedFileEntity;
import kr.co.digigroove.commons.utils.FileUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class AdministrationFileServiceImpl implements AdministrationFileService {
	@Value("#{fileConfig['filePath']}")
	private String filePath;
	
	@Autowired
	private AdministrationFileDAO administrationFileDAO;
	
	/**
	 * 파일 저장 후 정보 리턴 (Basic)
	 * @param deviceEntity (targetType, fileList)
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	public List<SavedFileEntity> saveFileForBasic(MultipartHttpServletRequest req, DeviceEntity deviceEntity) throws Exception {
		List<SavedFileEntity> savedFileList = new ArrayList<SavedFileEntity>();
		String path = filePath + deviceEntity.getFileTarget() + "/";
		List<MultipartFile> fileList = deviceEntity.getFileList();
		if (fileList != null) {
			for (MultipartFile file : fileList) {
				savedFileList.add(FileUtils.saveFile(path, file));
			}
		}
		return savedFileList;
	}
	
	/**
	 * 파일 저장 후 정보 리턴 (FormData)
	 * @param req
	 * @param administrationFileEntity
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	public List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) throws Exception {
		// 파일 저장 정보
		List<SavedFileEntity> savedFileList = new ArrayList<SavedFileEntity>();
		// Administration_file 에 저장될 이미지 정보
		AdministrationFileEntity insertInfo = new AdministrationFileEntity();
		List<AdministrationFileEntity> insertFileList = new ArrayList<AdministrationFileEntity>();
		// Administration_file 에 저장될 thumb 이미지 정보
		List<AdministrationFileEntity> savedThumbFileList = new ArrayList<AdministrationFileEntity>();
		// 넘어온 이미지를 저장.
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		// 파일 경로
		String path = filePath + administrationFileEntity.getFileTarget() + "/";
		Iterator<String> itr = req.getFileNames();
		// 파일 제한
		CommonCode.FileLimit fileLimit = administrationFileEntity.getFileLimit();
		int i = 0;
		while (itr.hasNext()) { fileList.add(req.getFile(itr.next())); }
		for (MultipartFile file : fileList) {
			if (fileLimit != null && fileLimit.size < file.getSize()) throw new FileUploadException(fileLimit.text);
			savedFileList.add(FileUtils.saveFile(path, file));
			insertInfo.setFileTargetKey(administrationFileEntity.getFileTargetKey());		//타켓 키
			insertInfo.setFileTarget(administrationFileEntity.getFileTarget());				//타켓
			insertInfo.setFileName(savedFileList.get(i).getOriginalFileName());				//원본 이름
			insertInfo.setFileSavedName(savedFileList.get(i).getSavedFileName());			//저장 이름
			insertInfo.setFilePath(savedFileList.get(i).getSavedPath());					//경로
			insertInfo.setFileExtension(savedFileList.get(i).getSavedFileExtension());		//확장자
			insertInfo.setFileSize((int)savedFileList.get(i).getSavedFileSize());			//사이즈
			insertInfo.setFileType(CommonCode.FILE_ORI_TYPE);								//타입 1: 일반, 2: 썸네일
			insertFileList.add(insertInfo);
			//썸네일을 생성할 경우
			if(CommonCode.FILE_THUMB_Y.equals(administrationFileEntity.getThumbYn())) {
				savedThumbFileList.add(this.saveThumbFileForFormData(insertInfo));
			}
			i++;
		}
		//일반 파일
		administrationFileEntity.setSaveFileList(insertFileList);
		this.insertSavedFileInfo(administrationFileEntity);
		//썸네일 파일
		if(CommonCode.FILE_THUMB_Y.equals(administrationFileEntity.getThumbYn())) {
			administrationFileEntity.setSaveFileList(savedThumbFileList);
			this.insertSavedFileInfo(administrationFileEntity);
		}
		return savedFileList;
	}

	/**
	 * 썸네일 생성
	 * @param fileInfo
	 * @return
	 */
	@Override
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	public AdministrationFileEntity saveThumbFileForFormData(AdministrationFileEntity fileInfo) {
		AdministrationFileEntity fileEntity = new AdministrationFileEntity();
		try {
  			  //파일 경로
			  String path = filePath + fileInfo.getFileTarget() + "/";
			  String saveFile = path+"thumb_"+fileInfo.getFileSavedName();
			  String loadFile = path+fileInfo.getFileSavedName();
			  int maxDim = CommonCode.FILE_THUMB_MAXDIM;
			  File save = new File(saveFile.replaceAll("/", "\\" + File.separator));
			  FileInputStream fis = new FileInputStream(loadFile.replaceAll("/", "\\" + File.separator));
			  BufferedImage im = ImageIO.read(fis);
			  Image inImage = new ImageIcon(loadFile).getImage();
			  double scale;
			  if (inImage.getWidth(null) > inImage.getHeight(null)) {
				  scale = (double) maxDim / (double) inImage.getWidth(null);
			  } else {
				  scale = (double) maxDim / (double) inImage.getHeight(null);
			  }

			  int scaledW = (int) (scale * inImage.getWidth(null));
			  int scaledH = (int) (scale * inImage.getHeight(null));
			  BufferedImage thumb = new BufferedImage(scaledW, scaledH, BufferedImage.TYPE_INT_ARGB_PRE);
			  Graphics2D g2 = thumb.createGraphics();
			  g2.drawImage(im, 0, 0, scaledW, scaledH, null);
			  ImageIO.write(thumb, "png", save);
			  
			  fileEntity.setFileTargetKey(fileInfo.getFileTargetKey());					//파일 대상키 
			  fileEntity.setFileTarget(fileInfo.getFileTarget());						//파일 대상 
			  fileEntity.setFileName("thumb_"+fileInfo.getFileName() );					//원본 파일명
			  fileEntity.setFileSavedName("thumb_"+fileInfo.getFileSavedName() );		//저장 파일명
			  fileEntity.setFileExtension(fileInfo.getFileExtension() );				//확장자 
			  fileEntity.setFileSize((int)save.length() );								//파일 사이즈 
			  fileEntity.setFileWidth(scaledW);											//파일 사이즈 
			  fileEntity.setFileHeight(scaledH);										//파일 사이즈 
			  fileEntity.setFilePath( fileInfo.getFilePath() );							//파일 경로 
			  fileEntity.setFileType(CommonCode.FILE_THUMB_TYPE);						//파일 타입 1: 일반, 2:썸네일
        } catch (Exception e) {
            e.printStackTrace();
        }
		return fileEntity;
	}
	/**
	 * 저장된 파일리스트 받아 DB에 저장
	 * @param administrationFileEntity (targetType, targetKey, savedFileList)
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	public int insertSavedFileInfo(AdministrationFileEntity administrationFileEntity) throws Exception {
		int insertResult = CommonCode.ZERO;
		for (AdministrationFileEntity savedFile : administrationFileEntity.getSaveFileList()) {
			if (savedFile.getFileSize() > 0) {
				insertResult += administrationFileDAO.insertAdministrationFile(savedFile);
			}
		}
		return insertResult == administrationFileEntity.getSaveFileList().size() ? CommonCode.ONE : CommonCode.ZERO;
	}
	/**
	 * 파일 삭제
	 * @param administrationFileEntity 
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(readOnly=false, rollbackFor = Exception.class)
	public int removeAdministrationFile(AdministrationFileEntity administrationFileEntity) throws Exception {
		return administrationFileDAO.removeAdministrationFile(administrationFileEntity);
	}

	@Override
	public void removeFile(AdministrationFileEntity fileInfo) {
	  try {
		String path = filePath + fileInfo.getFileTarget() + "/" + fileInfo.getFileSavedName();
		FileUtils.deleteFile(path);
		if(CommonCode.FILE_THUMB_Y.equals(fileInfo.getThumbYn())) {
		  path = filePath + fileInfo.getFileTarget() + "/thumb_" + fileInfo.getFileSavedName();
		  FileUtils.deleteFile(path);
		}
	  } catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	  }
	}
}
