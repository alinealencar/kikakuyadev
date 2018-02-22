package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kikakuya.delegate.BudgetDelegate;

import kikakuya.model.Event;
import kikakuya.model.Good;
import kikakuya.model.BudgetForm;
import kikakuya.model.Vendor;

@Controller
public class BudgetController {
	@Autowired
	private BudgetDelegate budgetDelegate;
	
	@RequestMapping(value="/budget", method = RequestMethod.GET)
	public String viewBudget(Model model, HttpServletRequest request) throws SQLException{
		model.addAttribute("vendor", new Vendor());
		model.addAttribute("good", new Good());
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
		
		//Get list of all goods
		BudgetForm goodsListForm = new BudgetForm();
		request.setAttribute("goodsListForm", goodsListForm);
		return "budget";
	}
	
	@RequestMapping(value="/addSearchVendor", method = RequestMethod.POST)
	public String processAddSearchVendor(HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		
		//for testing
		Event event = new Event(); 
		event.setEventId(1); 
				
		String redirectTo = "budget";
		HttpSession session = request.getSession();
		try {
			if(budgetDelegate.addVendor(vendor)){
				vendor.setVendorId(budgetDelegate.findLastInserted());
				if(budgetDelegate.addVendorEvent(vendor, event))
					redirectTo = "budget";	
			}
			List vendorList = budgetDelegate.getVendors();
			request.setAttribute("vendors", vendorList);
			//String category = request.getParameter("category");
			//session.setAttribute("category", category);
		} catch (SQLException e) {
			redirectTo = "searchResult";
			e.printStackTrace();
		}
		return redirectTo;
	}
	
	@RequestMapping(value="/addVendor", method = RequestMethod.POST)
	public String processAddVendor(HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		
		String redirectTo = "budget";
		//for testing
		Event event = new Event(); 
		event.setEventId(1);
		
		try {
			if(budgetDelegate.addVendor(vendor)){
				vendor.setVendorId(budgetDelegate.findLastInserted());
				if(budgetDelegate.addVendorEvent(vendor, event))
					redirectTo = "budget";	
			} 
			List vendorList = budgetDelegate.getVendors();
			request.setAttribute("vendors", vendorList);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return redirectTo;
	}
	
	@RequestMapping(value="/addToBudget", method = RequestMethod.POST)
	public String processAddToBudget(Model model, HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
				
		String redirectTo = "budget";
		//for testing
		Event event = new Event(); 
		event.setEventId(1);
				
		try {
			if(budgetDelegate.addVendorEvent(vendor, event)){
				for(int i=0; i<vendor.getGoodsList().size(); i++){
					budgetDelegate.addGood(vendor.getGoodsList().get(i), budgetDelegate.getVendorEventId(vendor));
				}
				redirectTo = "budget";
				List vendorList = budgetDelegate.getVendors();
				request.setAttribute("vendors", vendorList);
				viewBudget(model,request);
			}
		} catch (SQLException e) {
			request.setAttribute("searchError", "Error adding vendor to budget. Please try again.");
			e.printStackTrace();
		}
		return redirectTo;
	}
	
	@RequestMapping(value="/editBudget", method = RequestMethod.POST)
	public String processEditBudget(Model model, HttpServletRequest request, @ModelAttribute BudgetForm budgetForm){
		String redirectTo = "budget";
		double newTotalBudget = budgetForm.getTotalBudget();
		List<Good> goodsList = budgetForm.getGoodsList();
		
		try {
			//Update goods
			for(int i = 0; i < goodsList.size(); i++){
				budgetDelegate.editGood(goodsList.get(i));
			}
			
			//Update total budget
				budgetDelegate.editTotalBudget(1, newTotalBudget);
			
			//Refresh budget info
			viewBudget(model, request);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return redirectTo;
	}
	
	@RequestMapping(value="/deleteGood", method = RequestMethod.POST)
	public String deleteGood(Model model, HttpServletRequest request, @ModelAttribute Good good){
		System.out.println("entrou no delete good");
		
		try {
			viewBudget(model, request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "budget";
	}
}

