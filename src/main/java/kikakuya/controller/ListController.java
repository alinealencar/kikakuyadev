package kikakuya.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	@RequestMapping(value="/lists", method = RequestMethod.GET)
	public String viewAddEvent(Model model, HttpServletRequest request) throws SQLException{
		//model.addAttribute("event", new Event());
		return "lists";
	}
}
