package kikakuya.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kikakuya.utilities.AuthenticationUtilities;

public class RememberMeFilter implements Filter {
	DataSource dataSource;

    public RememberMeFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// Check if user chose Remember Me (automatically log the user in and redirect them to the home page)
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		try{
			// Check if user has the RememberMe cookies (uuid and user) or if the user is currently logged in
			if(AuthenticationUtilities.isRememberMe(request, dataSource) || AuthenticationUtilities.isLoggedIn(request.getSession())){
				response.sendRedirect("home.jsp");
			}
			else
				chain.doFilter(request, response);
		} catch (Exception e){
			e.printStackTrace();
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		ServletContext ctx = fConfig.getServletContext();
		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(ctx);
		dataSource = (DataSource) springContext.getBean("dataSource");
		//ctx.setAttribute("INFO", beanRep.getInfoFromDB());
	}

}
