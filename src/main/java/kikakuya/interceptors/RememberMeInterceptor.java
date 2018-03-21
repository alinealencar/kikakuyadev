package kikakuya.interceptors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kikakuya.utilities.AuthenticationUtilities;

public class RememberMeInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
//		DataSource dataSource;
//		
//		ServletContext ctx = fConfig.getServletContext();
//		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(ctx);
//		dataSource = (DataSource) springContext.getBean("dataSource");
//		
//		try{
//			// Check if user has the RememberMe cookies (uuid and user) or if the user is currently logged in
//			if(AuthenticationUtilities.isRememberMe(request, dataSource) || AuthenticationUtilities.isLoggedIn(request.getSession())){
//				response.sendRedirect("list");
//			}
//			else{
//				response.sendRedirect("login");
//			}
//		} catch (Exception e){
//			e.printStackTrace();
//		}		
//		return false;
		return true;
	}

}
