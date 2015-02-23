package kr.co.clapp.entities.validation;

import java.io.Serializable;

import kr.co.digigroove.commons.utils.StringUtils;

/**
 * Created by dnltpdnd on 14. 12. 26.
 */
public class FormBindingResultEntity implements Serializable {

  private static final long serialVersionUID = -8783003058976089168L;

  private String objectName;
  private String code;
  private String errorCode;
  private String field;
  private String message;

  public String getObjectName() {
    return objectName;
  }

  public void setObjectName(final String objectNameParam) {
    objectName = objectNameParam;
  }

  public String getCode() {
    return code;
  }

  public void setCode(final String codeParam) {
    code = codeParam;
  }

  public String getErrorCode() {
    return errorCode;
  }

  public void setErrorCode(final String errorCodeParam) {
    errorCode = errorCodeParam;
  }

  public String getField() {
    return field;
  }

  public void setField(final String fieldParam) {
    field = fieldParam;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(final String messageParam) {
    message = messageParam;
  }

  public void setResultEntity(FormBindingResultEntity formValidationResult) {
    if (!StringUtils.isEmpty(formValidationResult.getObjectName())) {
      this.objectName = formValidationResult.getObjectName();
    }

    if (!StringUtils.isEmpty(formValidationResult.getCode())) {
      this.code = formValidationResult.getCode();
    }

    if (!StringUtils.isEmpty(formValidationResult.getErrorCode())) {
      this.errorCode = formValidationResult.getErrorCode();
    }

    if (!StringUtils.isEmpty(formValidationResult.getField())) {
      this.field = formValidationResult.getField();
    }

    if (!StringUtils.isEmpty(formValidationResult.getMessage())) {
      this.message = formValidationResult.getMessage();
    }
  }
}
