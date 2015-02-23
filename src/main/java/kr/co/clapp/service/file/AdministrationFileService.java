package kr.co.clapp.service.file;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.clapp.entities.AdministrationFileEntity;
import kr.co.clapp.entities.DeviceEntity;
import kr.co.digigroove.commons.entities.SavedFileEntity;

public interface AdministrationFileService {

	List<SavedFileEntity> saveFileForBasic(MultipartHttpServletRequest req, DeviceEntity deviceEntity) throws Exception;

	List<SavedFileEntity> saveFileForFormData(MultipartHttpServletRequest req, AdministrationFileEntity administrationFileEntity) throws Exception;

	int removeAdministrationFile(AdministrationFileEntity administrationFileEntity) throws Exception;

	int insertSavedFileInfo(AdministrationFileEntity administrationFileEntity) throws Exception;

	AdministrationFileEntity saveThumbFileForFormData(AdministrationFileEntity fileInfo);

	void removeFile(AdministrationFileEntity administrationFileEntity);



}
