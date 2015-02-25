package kr.co.clapp.utils;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.clapp.constants.CommonCode;
import kr.co.digigroove.commons.utils.StringUtils;

public class Utils {
	private static final Logger logger = LoggerFactory.getLogger(Utils.class);
	
	/**
	 * 클라이언트 IP 주소를 가져옵니다.
	 * @param request
	 * @return
	 */
	public  static String getRomoteIp(HttpServletRequest request) {
		return  request.getRemoteHost().toString();
	}
	/**
	 * 현재 서버의 IP 주소를 가져옵니다.
	 *
	 * @return IP 주소
	 */
	public static String getLocalServerIp(HttpServletRequest request)
	{
	try
	{    
	   for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();)
	   {
	       NetworkInterface intf = en.nextElement();
	       for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();)
	       {
	           InetAddress inetAddress = enumIpAddr.nextElement();
	           if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress())
	           {
	           	return inetAddress.getHostAddress().toString();
	           }
	       }
	   }
	}
	catch (Exception ex) {}
	return null;
	}
	/**
	 * 접속한 아이피와 서버아이피를 비교한다.
	 * @param request
	 * @return
	 */
	public static  boolean checkRemoteIp(HttpServletRequest request){
		boolean flag = false;
		String remoteIp = getRomoteIp(request);
		String localIp = getLocalServerIp(request);
		if(remoteIp.equals(localIp)) {
			flag = true;
		}
		return flag;
	}
	public static Date getAddNowDate(int addDate) {
		Date nowDate = new Date();
		return getAddNowDate(nowDate, addDate);
	}
	public static Date getAddNowDate(Date nowDate, int addDate) {
		if(StringUtils.isEmpty(nowDate)) {
			Date date = new Date();
			nowDate = date;
		}
		Calendar cal = Calendar.getInstance();
	    cal.setTime(nowDate);
	    cal.add(Calendar.DATE, addDate);
	     
	    // 특정 형태의 날짜로 값을 뽑기
	    DateFormat df = new SimpleDateFormat(CommonCode.DatePattern.DASH);
	    String strDate = df.format(cal.getTime());
	    return cal.getTime();
	}
}
