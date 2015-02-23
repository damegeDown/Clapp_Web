package kr.co.clapp.interceptors;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.AdminEntity;
import kr.co.clapp.entities.MemberEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AuthenticationCheckInterceptor  extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationCheckInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String isAdmin = String.valueOf(CommonCode.ZERO);
		String sessionType = CommonCode.Session.USER_LOGIN_SESSION;
		if (request.getRequestURI().contains("admin")) {
			isAdmin = String.valueOf(CommonCode.ONE);
			sessionType = CommonCode.Session.ADMIN_LOGIN_SESSION;
		}
		
		String url = request.getRequestURL().toString();
		if ( request.getQueryString() != null )
		url = url + "?" + request.getQueryString();
		
		if (request.getSession().getAttribute(sessionType) == null) {
			// Ajax 호출인 경우
			if ("XMLHttpRequest".equalsIgnoreCase(request.getHeader("x-requested-with")) || "Ajax".equalsIgnoreCase(request.getHeader("x-requested-with"))) {
				response.sendRedirect(request.getContextPath() + "/error/commonErrorAjax?errorCode=sessionExpired");
			} else {
				response.sendRedirect(request.getContextPath() + "/common/error?resultCode=authFail&redirect=login&isAdmin="+isAdmin);
			}
			return false;
		} else {
			if(isAdmin.equals(CommonCode.ONE)) {
				AdminEntity AdminLoginSession =  (AdminEntity) request.getSession().getAttribute(sessionType);
				String path = request.getRequestURL().toString();
				String permissionMaster = AdminLoginSession.getPermissionMaster();
				String permissionUser = AdminLoginSession.getPermissionUser();
				String permissionPayment = AdminLoginSession.getPermissionPayment();
				String permissionProduct = AdminLoginSession.getPermissionProduct();
				String permissionDevice = AdminLoginSession.getPermissionDevice();
				String permissionTrend = AdminLoginSession.getPermissionTrend();
				String permissionEcrm = AdminLoginSession.getPermissionEcrm();
				String permissionCustomer = AdminLoginSession.getPermissionCustomer();
				Map<String, Object> permissionObj = new HashMap<String, Object>();
				permissionObj.put("management", permissionMaster);
				permissionObj.put("user", permissionUser);
				permissionObj.put("payment", permissionPayment);
				permissionObj.put("product", permissionProduct);
				permissionObj.put("device", permissionDevice);
				permissionObj.put("trend", permissionTrend);
				permissionObj.put("ecrm", permissionEcrm);
				permissionObj.put("customer", permissionCustomer);
		        for( String key : permissionObj.keySet() ){
		        	if(path.contains(key)) {
		        		if(!permissionObj.get(key).equals("Y")) {
		        			response.sendRedirect(request.getContextPath() + "/admin/main");
		        			return false;
		        		}
		        	}
		        }
			} else {
				
			}
		}
		logger.info("인터셉터 체크 : 인증체크");
		return true;
	}
	
}
 