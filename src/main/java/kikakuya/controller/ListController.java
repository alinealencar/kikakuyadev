package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.ListDelegate;
import kikakuya.model.Event;
import kikakuya.model.Lists;

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
	
	
}
