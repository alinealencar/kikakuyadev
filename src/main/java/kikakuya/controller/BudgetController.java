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
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("budgetForm", new BudgetForm());
		Event event = (Event) request.getSession(false).getAttribute("event");
		try{
			List vendorList = budgetDelegate.getVendors(event);
			request.setAttribute("vendors", vendorList);
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		//Show budget
		Map<String, Map<Vendor, List<Good>>> budgetInfo = budgetDelegate.showBudget(event.getEventId());
		request.setAttribute("budgetInfo", budgetInfo);
		
		//Get list of all goods
		BudgetForm budgetForm = new BudgetForm();
		request.setAttribute("budgetForm", budgetForm);
		
		//Show budget as default
		request.setAttribute("goodDeleted", "");
		return "budget";
	}
	
	@RequestMapping(value="/addSearchVendor", method = RequestMethod.POST)
	public String processAddSearchVendor(Model model, HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		String redirectTo = "redirect:/budget";
		Event event = (Event) request.getSession().getAttribute("event");
		
		try {
			//add new vendor from search
			if(budgetDelegate.addVendor(vendor)){
				vendor.setVendorId(budgetDelegate.findLastInserted());
				if(budgetDelegate.addVendorEvent(vendor, event))
					redirectTo = "redirect:/budget";	
			}
			List vendorList = budgetDelegate.getVendors(event);
			request.setAttribute("vendors", vendorList);
			
			viewBudget(model,request);
		} catch (SQLException e) {
			redirectTo = "searchResult";
			e.printStackTrace();
		}
		return redirectTo;
	}
	
	@RequestMapping(value="/addVendor", method = RequestMethod.POST)
	public String processAddVendor(Model model, HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
		
		String redirectTo = "redirect:/budget";
		
		Event event = (Event) request.getSession().getAttribute("event");
		
		try {
			//add new vendor
			if(budgetDelegate.addVendor(vendor)){
				vendor.setVendorId(budgetDelegate.findLastInserted());
				if(budgetDelegate.addVendorEvent(vendor, event))
					redirectTo = "redirect:/budget";	
			} 
			List vendorList = budgetDelegate.getVendors(event);
			request.setAttribute("vendors", vendorList);
			viewBudget(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return redirectTo;
	}
	
	@RequestMapping(value="/addToBudget", method = RequestMethod.POST)
	public String processAddToBudget(Model model, HttpServletRequest request, @ModelAttribute("vendor") Vendor vendor){
				
		String redirectTo = "redirect:/budget";
		Event event = (Event) request.getSession().getAttribute("event");
				
		try {
			//add new vendorvent
			if(!budgetDelegate.isVendorFound(vendor)){
				//vendor.setVendorId(budgetDelegate.findLastInserted());
				budgetDelegate.addVendorEvent(vendor, event);
			}
			//update category column
			budgetDelegate.editCategory(vendor);
			//insert goods
			for(int i=0; i<vendor.getGoodsList().size(); i++){
				budgetDelegate.addGood(vendor.getGoodsList().get(i), budgetDelegate.getVendorEventId(vendor));
			}
			redirectTo = "redirect:/budget";
			List vendorList = budgetDelegate.getVendors(event);
			request.setAttribute("vendors", vendorList);
			viewBudget(model,request);
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
			if(goodsList != null && goodsList.size() > 0) {
				for(int i = 0; i < goodsList.size(); i++){
					budgetDelegate.editGood(goodsList.get(i));
				}
			}
				
			//Update total budget
			budgetDelegate.editTotalBudget(1, newTotalBudget);
			
			//Update event object in the session scope
			Event event = (Event) request.getSession().getAttribute("event");
			event.setTotalBudget(newTotalBudget);
			request.getSession().setAttribute("event", event);
			request.setAttribute("editSuccess", "Budget was updated successfully.");
			viewBudget(model, request);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		return redirectTo;
	}
	
	@RequestMapping(value="/deleteGood", method = RequestMethod.POST)
	public String deleteGood(Model model, HttpServletRequest request, @ModelAttribute BudgetForm budgetForm){
		try {
			//delete good
			budgetDelegate.deleteGood(budgetForm.getGoodId());
			
			//if there's no goods anymore for this vendor, delete it
			if(budgetDelegate.isZeroGoods(budgetForm.getVendorId())){
				budgetDelegate.deleteVendorEvent(budgetForm.getVendorId());
				budgetDelegate.deleteVendor(budgetForm.getVendorId());
			}
			viewBudget(model, request);
			request.setAttribute("goodDeleted", "Good deleted successfully.");
		} catch (SQLException e) {
				e.printStackTrace();
		}
		
		return "budget";
	}
	
	@RequestMapping(value="/deleteVendor", method = RequestMethod.POST)
	public String deleteVendor(Model model, HttpServletRequest request, @ModelAttribute BudgetForm budgetForm){
		try {
			//budgetDelegate.deleteGoodsByVendor(budgetForm.getVendorId());
			budgetDelegate.deleteVendorEvent(budgetForm.getVendorId());
			budgetDelegate.deleteVendor(budgetForm.getVendorId());
			
			viewBudget(model, request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "budget";
	}
	
	@RequestMapping(value="/deleteCategory", method = RequestMethod.POST)
	public String deleteCategory(Model model, HttpServletRequest request, @ModelAttribute BudgetForm budgetForm){
		String category = budgetForm.getCategory();
		Event event = (Event) request.getSession().getAttribute("event");
		System.out.println("in the delete category");
		try {
			//delete vendor associated to a certain category? Now you can't add one vendor in 2 different categories,
			//so it makes sense to delete the vendor too. Bug or feature?
			budgetDelegate.deleteCategory(event.getEventId(), category);
			viewBudget(model, request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "budget";
	}
	
	@RequestMapping(value="/showVendor", method = RequestMethod.POST)
	@ResponseBody
	public Vendor viewVendor(Model model, HttpServletRequest request) {
		int vendorId = Integer.parseInt(request.getParameter("vendorId"));
		Vendor vendor = new Vendor();
		try {
			vendor = budgetDelegate.getVendor(vendorId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vendor;
	}
}

