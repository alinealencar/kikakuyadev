package kikakuya.controller;

import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.CalendarDelegate;
import kikakuya.model.Appointment;
import kikakuya.model.User;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarDelegate calendarDelegate;
	
	@RequestMapping(value="/calendar", method = RequestMethod.GET)
	public String viewAddEvent(Model model, HttpServletRequest request){
		//model.addAttribute("event", new Event());
		model.addAttribute("appt", new Appointment());
		return "calendar";
	}
	
	@RequestMapping(value="/addAppt", method = RequestMethod.POST)
	public String addAppt(Model model, HttpServletRequest request, @ModelAttribute("appt") Appointment appt){
		boolean apptAdded;
		try {
			User user = (User) request.getSession(false).getAttribute("user");
			appt.setUserId(user.getUserId());
			System.out.println(appt);
			apptAdded = calendarDelegate.addAppt(appt);
			if(apptAdded) {
				request.setAttribute("addApptSuccess", "The appointment was added succesfully.");
				System.out.println("Appt added");
			}
			else {
				request.setAttribute("addApptError", "The appointment was not added.");
				System.out.println("Add appt error");
			}
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
		}

		return "redirect:/calendar";
	}
}
