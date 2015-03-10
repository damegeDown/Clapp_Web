package kr.co.clapp.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.co.clapp.constants.CommonCode.Session;
import kr.co.clapp.entities.MemberEntity;
import kr.co.digigroove.commons.utils.StringUtils;

public class SessionListener implements  HttpSessionListener{
	private static SessionListener sessionListener = null;
	private static Hashtable<String, String> loginUsers = new Hashtable<String, String>();
	public SessionListener() {
		  super();
	 }
	 public static synchronized SessionListener getInstance() {
	  if (sessionListener == null) {
		  sessionListener = new SessionListener();
	 }
	  return sessionListener;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    System.out.println("Inside doGet(HttpServletRequest,HttpServletResponse)");

	    HttpSession session = request.getSession(true);
	    System.out.println("Session Id : " +session.getId() );
	    System.out.println( "Is New Session : " + session.isNew() );

	    int timeout = 10;
	    session.setMaxInactiveInterval(timeout);

	    System.out.println( "Max Inactive Interval : " + session.getMaxInactiveInterval() );

	    System.out.println("Exiting doGet(HttpServletRequest,HttpServletResponse)");
	    System.out.println();

	} 
	//해당 세션에 이미 로그인 되있는지 체크
	 public boolean isLogin(String sessionID) {
	  boolean isLogin = false;
	  Enumeration e = loginUsers.keys();
	  String key = "";  
	  while (e.hasMoreElements()) {
	   key = (String)e.nextElement();
	   if (sessionID.equals(key)) {
	    isLogin = true;
	   }
	  }
	  return isLogin;
	 }
	 //세션 생성
	 public void setSession(HttpSession session, String userID) {
	  loginUsers.put(userID, session.getId());
	  session.setAttribute("login", this.getInstance());
	 } 
	//세션 삭제
	 public void removeSession(String userID) {
	  loginUsers.remove(userID);
	 }
	// SessionEventListener

	public void sessionCreated(HttpSessionEvent httpSessionEvent) {
	    SessionBindingListener listener = new SessionBindingListener();
	    HttpSession httpSession = httpSessionEvent.getSession();
	    MemberEntity memberInfo = (MemberEntity) httpSession.getAttribute(Session.USER_LOGIN_SESSION);
	}


	public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
	    SessionBindingListener listener = new SessionBindingListener();
	    HttpSession httpSession = httpSessionEvent.getSession();
	    MemberEntity memberInfo = (MemberEntity) httpSession.getAttribute(Session.USER_LOGIN_SESSION);
	    if(!StringUtils.isEmpty(memberInfo)) {
	    	removeSession(memberInfo.getUserId());
	    }
	     
	}

}