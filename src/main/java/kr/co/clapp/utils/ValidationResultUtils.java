package kr.co.clapp.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.validation.CommonFormValidEntity;
import kr.co.clapp.entities.validation.FormBindingResultEntity;

/**
 * Created by dnltpdnd on 14. 12. 26.
 */
public class ValidationResultUtils {
  
  public static FormBindingResultEntity formValidationResult(
      BindingResult bindingResult) {
    FormBindingResultEntity formBindingResultEntity = new FormBindingResultEntity();
    String resultCode = CommonCode.SUCCESS;
    String reslutMessage = "";
    String resultField = "";

    if (bindingResult.hasErrors()) {
      List<FieldError> fieldErrorList = bindingResult.getFieldErrors();
      resultCode = CommonCode.FAIL;
      resultField = fieldErrorList.get(0).getField();
      reslutMessage = fieldErrorList.get(0).getDefaultMessage();
    }

    formBindingResultEntity.setCode(resultCode);
    formBindingResultEntity.setField(resultField);
    formBindingResultEntity.setMessage(reslutMessage);
    return formBindingResultEntity;
  }
  
  /**
   * 검증 그룹화 구분이 필요한 경우 사용 (ex: 회원가입)
   * @param validEntity
   * @param validGroup
   * @return
   */
  public static FormBindingResultEntity formValidationResult(
      CommonFormValidEntity validEntity, Class validGroup) {
    FormBindingResultEntity formBindingResultEntity = new FormBindingResultEntity();
    String resultCode = CommonCode.SUCCESS;
    String resultMessage = "";
    String resultField = "";
    ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    Validator validator = factory.getValidator();
    Set<ConstraintViolation<CommonFormValidEntity>> constraintViolations = validator
        .validate(validEntity, validGroup);

    Iterator<ConstraintViolation<CommonFormValidEntity>> iterator = constraintViolations.iterator();
    if (iterator.hasNext()) {
      resultCode = CommonCode.FAIL;
      ConstraintViolation<CommonFormValidEntity> constraintViolation = iterator.next();
      resultField = constraintViolation.getPropertyPath().toString();
      resultMessage = constraintViolation.getMessageTemplate();
    }
      
    formBindingResultEntity.setCode(resultCode);
    formBindingResultEntity.setField(resultField);
    formBindingResultEntity.setMessage(resultMessage);
    return formBindingResultEntity;
  }
}
