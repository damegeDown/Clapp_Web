package kr.co.clapp.entities;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.apache.commons.lang.StringUtils;

import kr.co.digigroove.commons.entities.PageNavigationEntity;

/**
 * Created by sangyong on 11/13/14.
 */
public class PageEntity extends PageNavigationEntity {
  private static final long serialVersionUID = 3286446354188420056L;

  /** 페이지 그룹 수 */
  public final static int PAGE_GROUP_SIZE_PARAM = 10;
  public final static int PAGE_GROUP_SIZE_PARAM_30 = 30;
  public final static int PAGE_GROUP_SIZE_PARAM_50 = 50;
  /** 페이지 그룹 수(문제 리스트) */
  public final static int QUESTION_PAGE_GROUP_SIZE_PARAM = 15;
  /** 페이지 그룹 수(엑셀 출력) */
  public final static int EXCEL_GROUP_SIZE_PARAM = 99999999;
  /** 페이지에 출력될 게시물 수 */
  public final static int PAGE_LIST_SIZE_PARAM = 10;
  public final static int PAGE_LIST_SIZE_PARAM_11 = 11;
  public final static int PAGE_LIST_SIZE_PARAM_12 = 12;
  public final static int PAGE_LIST_SIZE_PARAM_20 = 20;
  public final static int PAGE_LIST_SIZE_PARAM_30 = 30;
  public final static int PAGE_LIST_SIZE_PARAM_50 = 50;
  public final static int PAGE_LIST_SIZE_PARAM_100 = 100;
  /** 페이지에 출력될 게시물 수 (엑셀 출력) */
  public final static int EXCEL_LIST_SIZE_PARAM = 1;
	
  private final static String DEFAULT_LABEL_FIRST_PAGE = "<img src='/resources/img/icon-first.gif'/>";
  private final static String DEFAULT_LABEL_LAST_PAGE  = "<img src='/resources/img/icon-last.gif'/>";
  private final static String DEFAULT_LABEL_GROUP_PREV = "<img src='/resources/img/icon-prev.gif'/>";
  private final static String DEFAULT_LABEL_GROUP_NEXT = "<img src='/resources/img/icon-next.gif'/>";

  private String searchKey;
  private String searchKey1;
  private String searchText; 
  private String searchValue;
  private String searchValue1;
  private String searchValue2;
  private String searchValue3;
  private String searchValue4;
  private String searchValue5;
  private String searchValue6;
  private String searchValue7;
  private String searchValue8;
  private String searchValue9;
  private int searchListSize = PAGE_GROUP_SIZE_PARAM;
  private String startDate;
  private String endDate;
  private List<?> searchValueArr;
  
  public PageEntity ( final long currentPageParam, final int pageGroupSizeParam, final int pageListSizeParam ) {
    super( currentPageParam, pageGroupSizeParam, pageListSizeParam );
    setLabelsInit();
  }

  public PageEntity ( final long currentPageParam ) {
    super( currentPageParam );
    setLabelsInit();
  }

  private void setLabelsInit() {
    this.setLabelFirstPage(DEFAULT_LABEL_FIRST_PAGE);
    this.setLabelLastPage(DEFAULT_LABEL_LAST_PAGE);
    this.setLabelGroupPrevious(DEFAULT_LABEL_GROUP_PREV);
    this.setLabelGroupNext(DEFAULT_LABEL_GROUP_NEXT);
  }

  public void setPageParams(){
	Map<String, Object> paramsMap = new ConcurrentHashMap<String, Object>();
	if (StringUtils.isNotEmpty(searchKey))   paramsMap.put("searchKey", searchKey);
	if (StringUtils.isNotEmpty(searchKey1))   paramsMap.put("searchKey1", searchKey1);
	if (StringUtils.isNotEmpty(searchText))  paramsMap.put("searchText", searchText);
	if (StringUtils.isNotEmpty(searchValue)) paramsMap.put("searchValue", searchValue);
	if (StringUtils.isNotEmpty(searchValue1)) paramsMap.put("searchValue1", searchValue1);
	if (StringUtils.isNotEmpty(searchValue2)) paramsMap.put("searchValue2", searchValue2);
	if (StringUtils.isNotEmpty(searchValue3)) paramsMap.put("searchValue3", searchValue3);
	if (StringUtils.isNotEmpty(searchValue4)) paramsMap.put("searchValue4", searchValue4);
	if (StringUtils.isNotEmpty(searchValue5)) paramsMap.put("searchValue5", searchValue5);
	if (StringUtils.isNotEmpty(searchValue6)) paramsMap.put("searchValue6", searchValue6);
	if (StringUtils.isNotEmpty(searchValue7)) paramsMap.put("searchValue7", searchValue7);
	if (StringUtils.isNotEmpty(searchValue8)) paramsMap.put("searchValue8", searchValue8);
	if (StringUtils.isNotEmpty(searchValue9)) paramsMap.put("searchValue9", searchValue9);
	if (searchListSize > 0) paramsMap.put("searchListSize", searchListSize);
	if (StringUtils.isNotEmpty(startDate))   paramsMap.put("startDate", startDate);
	if (StringUtils.isNotEmpty(endDate))     paramsMap.put("endDate", endDate);
	super.setPageParams(paramsMap);
  }
  
  public String getSearchKey() {
	return searchKey;
  }

  public void setSearchKey(String searchKey) {
	this.searchKey = searchKey;
  } 

  public String getSearchKey1() {
	return searchKey1;
}

public void setSearchKey1(String searchKey1) {
	this.searchKey1 = searchKey1;
}

public String getSearchText() {
	return searchText;
  }

  public void setSearchText(String searchText) {
	this.searchText = searchText;
  }

  public String getSearchValue() {
	return searchValue;
  }

  public void setSearchValue(String searchValue) {
	this.searchValue = searchValue;
  }

  public String getStartDate() {
	return startDate;	
  }

  public void setStartDate(String startDate) {
	this.startDate = startDate;
  }

  public String getEndDate() {
	return endDate;
  }

  public void setEndDate(String endDate) {
	this.endDate = endDate;
  }

  public String getSearchValue1() {
	return searchValue1;
  }

  public void setSearchValue1(String searchValue1) {
	this.searchValue1 = searchValue1;
  }

  public String getSearchValue2() {
	return searchValue2;
  }

  public void setSearchValue2(String searchValue2) {
	this.searchValue2 = searchValue2;
  }

  public String getSearchValue3() {
	return searchValue3;
  }

  public void setSearchValue3(String searchValue3) {
	this.searchValue3 = searchValue3;
  }

  public String getSearchValue4() {
	return searchValue4;
  }

  public void setSearchValue4(String searchValue4) {
	this.searchValue4 = searchValue4;
  }

  public String getSearchValue5() {
	return searchValue5;
  }

  public void setSearchValue5(String searchValue5) {
	this.searchValue5 = searchValue5;
  }

  public String getSearchValue6() {
	return searchValue6;
  }

  public void setSearchValue6(String searchValue6) {
	this.searchValue6 = searchValue6;
  }

  public String getSearchValue7() {
	return searchValue7;
  }

  public void setSearchValue7(String searchValue7) {
	this.searchValue7 = searchValue7;
  }

  public String getSearchValue8() {
	return searchValue8;
  }

  public void setSearchValue8(String searchValue8) {
	this.searchValue8 = searchValue8;
  }

  public String getSearchValue9() {
	return searchValue9;
  }

  public void setSearchValue9(String searchValue9) {
	this.searchValue9 = searchValue9;
  }

  public int getSearchListSize() {
	return searchListSize;
}

public void setSearchListSize(int searchListSize) {
	this.searchListSize = searchListSize;
}

public List<?> getSearchValueArr() {
	return searchValueArr;
  }

public void setSearchValueArr(List<?> searchValueArr) {
	this.searchValueArr = searchValueArr;
}


}
