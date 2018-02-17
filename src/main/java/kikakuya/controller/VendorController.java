package kikakuya.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.VendorDelegate;
import kikakuya.model.Vendor;

@Controller
@RequestMapping(value="/addVendor")
public class VendorController {

	@Autowired
	private VendorDelegate vendorDelegate;
	
	@RequestMapping(method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		
		String redirectTo = "budget";
		
		try {
			if(vendorDelegate.addVendor(vendor))
				redirectTo = "budget";	
		} catch (SQLException e) {
			redirectTo = "searchResult";
			e.printStackTrace();
		}
		return redirectTo;
	}
}
