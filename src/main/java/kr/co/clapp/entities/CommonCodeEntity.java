package kr.co.clapp.entities;

import java.io.Serializable;

public class CommonCodeEntity implements Serializable{
 
	private static final long serialVersionUID =1L;

	//공통코드 마스터
		private String codeMasterCode;				// 공통코드 마스터 코드;
		private String codeMasterName;				// 공통코드 마스터 명;
		private String codeMasterRemark;				//공통코드 마스터 리마크

		private int commonCodeKey;					//pk
		private String commonName;						//코드명
		private String commonCode;						//코드 
		private int commonSort;						//코드 쇼팅
		private String commonCodeReferense;			//참조코드
		public String getCodeMasterCode() {
			return codeMasterCode;
		}
		public void setCodeMasterCode(String codeMasterCode) {
			this.codeMasterCode = codeMasterCode;
		}
		public String getCodeMasterName() {
			return codeMasterName;
		}
		public void setCodeMasterName(String codeMasterName) {
			this.codeMasterName = codeMasterName;
		}
		public String getCodeMasterRemart() {
			return codeMasterRemark;
		}
		public void setCodeMasterRemart(String codeMasterRemark) {
			this.codeMasterRemark = codeMasterRemark;
		}
		public int getCommonCodeKey() {
			return commonCodeKey;
		}
		public void setCommonCodeKey(int commonCodeKey) {
			this.commonCodeKey = commonCodeKey;
		}
		public String getCommonName() {
			return commonName;
		}
		public void setCommonName(String commonName) {
			this.commonName = commonName;
		}
		public String getCommonCode() {
			return commonCode;
		}
		public void setCommonCode(String commonCode) {
			this.commonCode = commonCode;
		}
		public int getCommonSort() {
			return commonSort;
		}
		public void setCommonSort(int commonSort) {
			this.commonSort = commonSort;
		}
		public String getCommonCodeReferense() {
			return commonCodeReferense;
		}
		public void setCommonCodeReferense(String commonCodeReferense) {
			this.commonCodeReferense = commonCodeReferense;
		}


	
}
