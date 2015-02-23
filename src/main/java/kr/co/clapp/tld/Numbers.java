package kr.co.clapp.tld;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

public class Numbers extends TagSupport {
	private static final long serialVersionUID = -6588134108076119998L;
	
	protected double value;
	protected String type = "";
	protected int digit = 0;
	
	public int doStartTag()
			throws JspException
	    {
	        try {
	        	BigDecimal result = null;
	        	if(value > 0) {
	        		BigDecimal bd = new BigDecimal(String.valueOf(value));
		        	if(value < 1) {
		        		digit = 0;
		        	}
		        	
		        	if(type.equals("down")) {
		        		result = bd.setScale(digit, BigDecimal.ROUND_DOWN);       //내림
		        	} else if(type.equals("up")) {
		        		result = bd.setScale(digit, BigDecimal.ROUND_UP);             //올림
		        	} else {
		        		result = bd.setScale(digit, BigDecimal.ROUND_HALF_UP);   //반올림
		        	}
	        	} else {
	        		result = new BigDecimal(String.valueOf(0));
	        	}
	            pageContext.getOut().print(result);
	            //System.out.println(d); 
	        } catch(IOException ioe) {
	          throw new JspTagException("Error:  IOException while writing to the user");
	        }
	        return SKIP_BODY;
	    }
	
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	} 
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getDigit() {
		return digit;
	}
	public void setDigit(int digit) {
		this.digit = digit;
	}
	
	
	
}
