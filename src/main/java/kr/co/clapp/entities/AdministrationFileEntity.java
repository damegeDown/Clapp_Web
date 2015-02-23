package kr.co.clapp.entities;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdministrationFileEntity extends PageEntity implements Serializable{
	private static final long serialVersionUID =1L;
	
	public AdministrationFileEntity() {
		super(1L);
	}
	
	private int fileKey;					// 고유키;
	private int fileTargetKey;				// 파일 대상키
	private String fileTarget;				// 파일 대상
	private String fileName;				// 파일 이름 
	private String fileSavedName;			// 파일 저장이름 
	private String filePath;				// 파일 경로
	private String fileExtension;			// 파일 확장자 
	private int    fileSize;				// 파일 크기 
	private int fileWidth;				// 파일 넓이 
	private int fileHeight;				// 파일 높이
	private String fileType;				// 파일 타입
	
	private String fileTargetKeyText;		// 파일 대상키
	private String fileTargetText;			// 파일 대상
	private String fileNameText;			// 파일 이름 
	private String filePathText;			// 파일 경로
	private String fileExtensionText;		// 파일 확장자 
	private String fileSizeText;			// 파일 크기 
	private String fileWidthText;			// 파일 넓이 
	private String fileHeightText;			// 파일 높이
	private String fileTypeText;		    // 파일 타입
	private String thumbYn;				    // 썸네일 이미지 생성여부
	private List<MultipartFile> fileList;
	private List<AdministrationFileEntity> saveFileList;
	private List<AdministrationFileEntity> saveThumbFileList;
	
	public int getFileKey() {
		return fileKey;
	}
	public void setFileKey(int fileKey) {
		this.fileKey = fileKey;
	}
	public int getFileTargetKey() {
		return fileTargetKey;
	}
	public void setFileTargetKey(int fileTargetKey) {
		this.fileTargetKey = fileTargetKey;
	}
	public String getFileTargetKeyText() {
		return fileTargetKeyText;
	}
	public void setFileTargetKeyText(String fileTargetKeyText) {
		this.fileTargetKeyText = fileTargetKeyText;
	}
	public String getFileTarget() {
		return fileTarget;
	}
	public void setFileTarget(String fileTarget) {
		this.fileTarget = fileTarget;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSavedName() {
		return fileSavedName;
	}
	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileExtension() {
		return fileExtension;
	}
	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public int getFileWidth() {
		return fileWidth;
	}
	public void setFileWidth(int fileWidth) {
		this.fileWidth = fileWidth;
	}
	public int getFileHeight() {
		return fileHeight;
	}
	public void setFileHeight(int fileHeight) {
		this.fileHeight = fileHeight;
	}
	public String getFileTargetText() {
		return fileTargetText;
	}
	public void setFileTargetText(String fileTargetText) {
		this.fileTargetText = fileTargetText;
	}
	public String getFileNameText() {
		return fileNameText;
	}
	public void setFileNameText(String fileNameText) {
		this.fileNameText = fileNameText;
	}
	public String getFilePathText() {
		return filePathText;
	}
	public void setFilePathText(String filePathText) {
		this.filePathText = filePathText;
	}
	public String getFileExtensionText() {
		return fileExtensionText;
	}
	public void setFileExtensionText(String fileExtensionText) {
		this.fileExtensionText = fileExtensionText;
	}
	public String getFileSizeText() {
		return fileSizeText;
	}
	public void setFileSizeText(String fileSizeText) {
		this.fileSizeText = fileSizeText;
	}
	public String getFileWidthText() {
		return fileWidthText;
	}
	public void setFileWidthText(String fileWidthText) {
		this.fileWidthText = fileWidthText;
	}
	public String getFileHeightText() {
		return fileHeightText;
	}
	public void setFileHeightText(String fileHeightText) {
		this.fileHeightText = fileHeightText;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileTypeText() {
		return fileTypeText;
	}
	public void setFileTypeText(String fileTypeText) {
		this.fileTypeText = fileTypeText;
	}
	
	public String getThumbYn() {
		return thumbYn;
	}
	public void setThumbYn(String thumbYn) {
		this.thumbYn = thumbYn;
	}
	public List<MultipartFile> getFileList() {
		return fileList;
	}
	public void setFileList(List<MultipartFile> fileList) {
		this.fileList = fileList;
	}
	public List<AdministrationFileEntity> getSaveFileList() {
		return saveFileList;
	}
	public void setSaveFileList(List<AdministrationFileEntity> saveFileList) {
		this.saveFileList = saveFileList;
	}
	public List<AdministrationFileEntity> getSaveThumbFileList() {
		return saveThumbFileList;
	}
	public void setSaveThumbFileList(
			List<AdministrationFileEntity> saveThumbFileList) {
		this.saveThumbFileList = saveThumbFileList;
	}
	
}
