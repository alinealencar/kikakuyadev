package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.ListDelegate;
import kikakuya.model.Event;
import kikakuya.model.Item;
import kikakuya.model.Lists;
import kikakuya.model.Vendor;

@Controller
public class ListController {
	
	@Autowired
	private ListDelegate listDelegate;
	
	//show lists
	@RequestMapping(value="/lists", method = RequestMethod.GET)
	public String viewLists(Model model, HttpServletRequest request) throws SQLException{
		
		Event event = (Event) request.getSession().getAttribute("event");
		model.addAttribute("list", new Lists());
		model.addAttribute("item", new Item());
		List<Lists> lists = new ArrayList<Lists>();
		List<Item> items = new ArrayList<>();
		Lists firstList = new Lists();
		Lists selectedList = (Lists)request.getSession().getAttribute("selectedList");
		try {
			//show all lists
			lists = listDelegate.getLists(event);
			if(lists.size() > 0){
				if( selectedList == null){
					//get first list in db
					firstList = lists.get(0);
					//show items of first list
					items = listDelegate.getItems(firstList);
					request.setAttribute("selectedList", firstList);
				}
				else{
					items = listDelegate.getItems(selectedList);
					request.setAttribute("selectedList", selectedList);
				}
				request.setAttribute("lists", lists);
				request.setAttribute("items", items);
			}
			else {
				request.setAttribute("noListMessage", "No list to display. Create one now.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "lists";
	}
	
	//add a list
	@RequestMapping(value="/addList", method = RequestMethod.POST)
	public String processAddList(Model model, HttpServletRequest request, @ModelAttribute("list") Lists list){
		String redirectTo = "lists";
		Event event = (Event) request.getSession().getAttribute("event");
		
		try {
			//add new list
			if(listDelegate.addList(list, event)){
				redirectTo = "lists";
			} 
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return redirectTo;
	
	}
	
	//show selected list items
	@RequestMapping(value="/showList", method = RequestMethod.POST)
	public String processSelectList(Model model, HttpServletRequest request, @ModelAttribute("list") Lists list){
		Lists selectedList = new Lists();
		List<Item> selectedListItems = new ArrayList<>();
		HttpSession session = request.getSession();
		try{
			//get selected list data 
			selectedList = listDelegate.getListById(list.getListId());
			//get items of selected list
			selectedListItems = listDelegate.getItems(selectedList);
			session.setAttribute("selectedList", selectedList);
			request.setAttribute("items", selectedListItems);
			viewLists(model, request);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "lists";
	}
	
	//add an item
	@RequestMapping(value="/addItem", method = RequestMethod.POST)
	public String processAddItem(Model model, HttpServletRequest request, @ModelAttribute("item") Item item){
		String redirectTo = "lists";
		//get selected list
		Lists list = (Lists)request.getSession().getAttribute("selectedList");
		List<Item> items = new ArrayList<>();
		item.setListidFK(list.getListId());
		try {
			System.out.println("list id: " + item.getListIdFK());
			System.out.println("item name: " + item.getItemName());
			//add new list item
			if(listDelegate.addItem(item)){
				items = listDelegate.getItems(list);
				request.setAttribute("items", items);
			} 
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return redirectTo;
	
	}
	
		//update item status
		@RequestMapping(value="/updateItemStatus", method = RequestMethod.POST)
		public String processUpdateItemStatus(Model model, HttpServletRequest request, @ModelAttribute("item") Item item){
			String redirectTo = "lists";
			//get selected list
			Lists list = (Lists)request.getSession().getAttribute("selectedList");
			List<Item> items = new ArrayList<>();
			//item.setListidFK(list.getListId());
			try {
				//update item status
				if(listDelegate.editItemStatus(item)){
					items = listDelegate.getItems(list);
					request.setAttribute("items", items);
				} 
				viewLists(model,request);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return redirectTo;
		
		}
	
	
}
