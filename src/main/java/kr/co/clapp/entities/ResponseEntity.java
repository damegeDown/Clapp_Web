package kr.co.clapp.entities;

import java.io.Serializable;

import kr.co.clapp.constants.ResultCode;

public class ResponseEntity implements Serializable {
	
	private static final long serialVersionUID = -5401842758440913937L;
	
	private String resultCode;
	private String resultMSG;
	private String resultURL;
	private String resultACT;
	private Object resultDATA;
	
	public void ResponsEntity() {
		this.resultCode = ResultCode.FAIL;
	}
	
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMSG() {
		return resultMSG;
	}

	public void setResultMSG(String resultMSG) {
		this.resultMSG = resultMSG;
	}

	public String getResultURL() {
		return resultURL;
	}

	public void setResultURL(String resultURL) {
		this.resultURL = resultURL;
	}

	public String getResultACT() {
		return resultACT;
	}

	public void setResultACT(String resultACT) {
		this.resultACT = resultACT;
	}

	public Object getResultDATA() {
		return resultDATA;
	}

	public void setResultDATA(Object resultDATA) {
		this.resultDATA = resultDATA;
	}
	
}