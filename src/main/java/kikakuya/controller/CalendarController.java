package kikakuya.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kikakuya.delegate.CalendarDelegate;
import kikakuya.model.Appointment;
import kikakuya.model.MonthPresentation;
import kikakuya.model.User;
import kikakuya.utilities.HelperUtilities;

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
	
	@RequestMapping(value = "/calendarNav", method = RequestMethod.POST)
	@ResponseBody
	public MonthPresentation Submit(ModelMap model, HttpServletRequest request, @RequestParam("month") String month, @RequestParam("year") String year, @RequestParam("action") String action) {	
		MonthPresentation monthPresentation = new MonthPresentation();
		Calendar monthCal = Calendar.getInstance();
		//nextMonth
		if(action.equals("nextMonth")){
			//Get information about next month using the Calendar class
			monthCal = HelperUtilities.getNextMonth(month, year);
		}
		//prevMonth
		else if(action.equals("prevMonth")){
			monthCal = HelperUtilities.getPrevMonth(month, year);
		}
		//nextYear
		else if(action.equals("nextYear")){
			monthCal = HelperUtilities.getNextYear(month, year);
		}
		//prevYear
		else {
			monthCal = HelperUtilities.getPrevYear(month, year);
		}

		monthPresentation.setName(HelperUtilities.getMonthName(monthCal));
		monthPresentation.setYear(monthCal.get(Calendar.YEAR));
		monthPresentation.setFirstDay(HelperUtilities.getDayOfWeek(monthCal));
		monthPresentation.setNumOfDays(HelperUtilities.getNumOfDays(monthCal));
		
		return monthPresentation;
	}
}
