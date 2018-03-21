package kikakuya.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kikakuya.utilities.AuthenticationUtilities;

@Component
public class AuthInterceptor implements HandlerInterceptor {
	// This method is called before the controller
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
    	
        if(AuthenticationUtilities.isLoggedIn(request.getSession()))
            return true;
        else {
        	//Redirect user to login page
        	response.sendRedirect(request.getContextPath());
            return true;

        }
    }

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {		
	}

}
