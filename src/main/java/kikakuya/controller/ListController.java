package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.ListDelegate;
import kikakuya.model.Event;
import kikakuya.model.Lists;
import kikakuya.model.Vendor;

@Controller
public class ListController {
	
	@Autowired
	private ListDelegate listDelegate;
	
	@RequestMapping(value="/lists", method = RequestMethod.GET)
	public String viewLists(Model model, HttpServletRequest request) throws SQLException{
		
		Event event = (Event) request.getSession().getAttribute("event");
		model.addAttribute("list", new Lists());
		List<Lists> lists = new ArrayList<Lists>();
		try {
			lists = listDelegate.getLists(event);
			request.setAttribute("lists", lists);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "lists";
	}
	
	@RequestMapping(value="/addList", method = RequestMethod.POST)
	public String processAddList(Model model, HttpServletRequest request, @ModelAttribute("list") Lists list){
		String redirectTo = "lists";
		Event event = (Event) request.getSession().getAttribute("event");
		
		try {
			//add new list
			if(listDelegate.addList(list, event)){
				redirectTo = "lists";
			} 
			//List lists = listDelegate.
			//request.setAttribute("vendors", vendorList);
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return redirectTo;
	
	}
	
}
