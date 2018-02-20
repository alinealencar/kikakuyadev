package kikakuya.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.VendorDelegate;
import kikakuya.model.Vendor;

@Controller
public class VendorController {

	@Autowired
	private VendorDelegate vendorDelegate;
	
	@RequestMapping(value="/addVendor", method = RequestMethod.POST)
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
	
	@RequestMapping(value="/budget", method = RequestMethod.GET)
	public String viewBudget(Model model, HttpServletRequest request) throws SQLException{
		//Get all categories
		
		//Get vendors by category
		
		//Get goods by vendors
		
		//Add everything to the request scope
		
		vendorDelegate.showBudget(1);
		return "budget";
	}

}
