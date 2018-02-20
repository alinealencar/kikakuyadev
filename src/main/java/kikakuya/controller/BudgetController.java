package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kikakuya.delegate.BudgetDelegate;
import kikakuya.model.Good;
import kikakuya.model.Vendor;

@Controller
public class BudgetController {
	@Autowired
	private BudgetDelegate budgetDelegate;
	
	@RequestMapping(value="/budget", method = RequestMethod.GET)
	public String viewBudget(Model model, HttpServletRequest request) throws SQLException{
		model.addAttribute("vendor", new Vendor());
		try{
			List vendorList = budgetDelegate.getVendors();
			request.setAttribute("vendors", vendorList);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		//Show budget
		Map<String, Map<Vendor, List<Good>>> budgetInfo = budgetDelegate.showBudget(1);
		request.setAttribute("budgetInfo", budgetInfo);
		return "budget";
	}
	
	@RequestMapping(value="/addVendor", method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		
		String redirectTo = "budget";
		
		try {
			if(budgetDelegate.addVendor(vendor))
				redirectTo = "budget";	
			List vendorList = budgetDelegate.getVendors();
			request.setAttribute("vendors", vendorList);
		} catch (SQLException e) {
			redirectTo = "searchResult";
			e.printStackTrace();
		}
		return redirectTo;
	}
}
