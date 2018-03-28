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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kikakuya.delegate.ListDelegate;
import kikakuya.model.BudgetForm;
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
		HttpSession session = request.getSession();
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
			
			//show first list when page is loaded
			if(lists.size() > 0){
				if( selectedList == null){
					//get first list in db
					firstList = lists.get(0);
					//show items of first list
					items = listDelegate.getItems(firstList);
					session.setAttribute("selectedList", firstList);
					//check if list contains items
					if(items.size() == 0)
						request.setAttribute("noItemsMsg", "No items found.");
					else
						request.setAttribute("items", items);
				}
				//show selected list by user
				else{
					//check if list exists (after delete)
					if(listDelegate.checkIfListExists(selectedList,event.getEventId())){
						items = listDelegate.getItems(selectedList);
						//check if list contains items
						if(items.size() == 0)
							request.setAttribute("noItemsMsg", "No items found.");
						else
							request.setAttribute("items", items);
					
						request.setAttribute("selectedList", selectedList);
					}
					//if deleted, show select first list
					else{
						firstList = lists.get(0);
						//show items of first list
						items = listDelegate.getItems(firstList);
						session.setAttribute("selectedList", firstList);
						request.setAttribute("items", items);
					}
				}
				request.setAttribute("lists", lists);
			}
			else {
				request.setAttribute("noListMessage", "No list to display.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "lists";
	}
	
	//add a list
	@RequestMapping(value="/addList", method = RequestMethod.POST)
	public String processAddList(Model model, HttpServletRequest request, RedirectAttributes redirectAtt, @ModelAttribute("list") Lists list){
		Event event = (Event) request.getSession().getAttribute("event");
		
		try {
			if(!listDelegate.checkIfListExists(list, event.getEventId())){
				System.out.println("add list successful!");
				//add new list
				listDelegate.addList(list, event);
			}
			else{
				System.out.println("add list unsuccessful!");
				redirectAtt.addFlashAttribute("listError", "The list already exists");
			}
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/lists";
	
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
		//get selected list
		Lists list = (Lists)request.getSession().getAttribute("selectedList");
		List<Item> items = new ArrayList<>();
		item.setListIdFK(list.getListId());
		item.setItemStatus(0);
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
		return "redirect:/lists";
	
	}
	
	//update item status
	@RequestMapping(value="/updateItemStatus", method = RequestMethod.POST)
	public String processUpdateItemStatus(Model model, HttpServletRequest request, @RequestParam("itemId") int itemId, @ModelAttribute("item") Item item){
		//get selected list
		Lists list = (Lists)request.getSession().getAttribute("selectedList");
		List<Item> items = new ArrayList<>();
		//item.setListidFK(list.getListId());
		if(item.getItemStatus() == null){
			item.setItemStatus(0);
		}
		try {
			item.setItemId(itemId);
			//update item status
			if(listDelegate.editItemStatus(item)){
				items = listDelegate.getItems(list);
				request.setAttribute("items", items);
			} 
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return "redirect:/lists";
		
	}
	
	//edit list
	@RequestMapping(value="/editList", method = RequestMethod.POST)
	public String processEditList(Model model, HttpServletRequest request, @ModelAttribute("list") Lists list, RedirectAttributes redirectAtt){
		HttpSession session = request.getSession();
		Lists firstList = new Lists();
		Event event = (Event) request.getSession().getAttribute("event");
		try{
			//Update lists
			for(int i=0; i<list.getListsList().size(); i++){
				if(!listDelegate.checkIfListExistsEdit(list.getListsList().get(i), event.getEventId())){
					listDelegate.editList(list.getListsList().get(i));
				}
				else{
					System.out.println("edit list unsuccessful!");
					redirectAtt.addFlashAttribute("listError", "A list already exists with the same title. Please use a different title.");
				}
			firstList = list.getListsList().get(0);
			session.setAttribute("selectedList", firstList);
		}
			viewLists(model,request);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/lists";	
	}
	
	//edit item
	@RequestMapping(value="/editItem", method = RequestMethod.POST)
	public String processEditItem(Model model, HttpServletRequest request, @ModelAttribute("item") Item item){
		try{
			//Update list items
			if(item.getItemsList() != null && item.getItemsList().size() > 0){
				for(int i=0; i<item.getItemsList().size(); i++){
					listDelegate.editItem(item.getItemsList().get(i));
				}
			}
			viewLists(model,request);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/lists";
	}
	
	@RequestMapping(value="/deleteList", method = RequestMethod.POST)
	public String deleteList(Model model, HttpServletRequest request, @ModelAttribute("list") Lists list){
		System.out.println("delete list");
		try {
			//delete a list
			System.out.println("List id: " + list.getListId());
			listDelegate.deleteList(list.getListId());
			viewLists(model,request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:/lists";
	}
	
	@RequestMapping(value="/deleteItem", method = RequestMethod.POST)
	public String deleteItem(Model model, HttpServletRequest request, @ModelAttribute("item") Item item){
		try{
			System.out.println("Item id: " + item.getItemId());
			listDelegate.deleteItem(item.getItemId());
			viewLists(model,request);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return "redirect:/lists";
	}
}
