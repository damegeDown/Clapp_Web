package kr.co.clapp.tld;


import java.io.IOException;




import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;


/**
 * 문자열 자르기 Tag 라이브러리
 */
public class CutText extends TagSupport{

private static final long serialVersionUID = 2101357978317140321L;
	
	private String text;
	private int length;
	private String ellipsis;

	public int doStartTag() throws JspException {

		try {
			pageContext.getOut().write(this.cutText(text, length, ellipsis));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
	
	/**
	* 문자열 자르기
	* @param text
	* @param length
	* @return
	*/
	public String cutText(String text, int length, String ellipsis) {
		int strLen = 0;
		char[] charArray = StringUtils.trim(text).toCharArray();
		int count;
		for (count = 0; count < charArray.length; count++) {
			if (strLen > length) {
				break;
			}
			if (charArray[count] >= '\uAC00' && charArray[count] <= '\uD7A3') {
				strLen += 2; // 한글
			} else {
				strLen++;
			}
		}
		if (text.length() <= count) {
			return text;
		} else {
			return text.substring(0, count - 1) + ellipsis ;
		}
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public int getLength() {
		return length;
	}
	
	public void setLength(int length) {
		this.length = length;
	}
	
	public String getEllipsis() {
		return ellipsis;
	}
	
	public void setEllipsis(String ellipsis) {
		this.ellipsis = ellipsis;
	}
}