package kikakuya.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String addAppt(Model model, HttpSession session, RedirectAttributes redirectAtt, @ModelAttribute("appt") Appointment appt){
		boolean apptAdded;
		try {
			User user = (User) session.getAttribute("user");
			appt.setUserId(user.getUserId());
			apptAdded = calendarDelegate.addAppt(appt);
			if(apptAdded) {
				//TODO Show success/error message for add appt
				redirectAtt.addFlashAttribute("addApptSuccess", "Appointment added");
				System.out.println("Appt added");
			}
			else {
				redirectAtt.addFlashAttribute("addApptError", "The appointment was not added.");
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
		if(action.equals("loadMonth")){
			monthCal = HelperUtilities.getLoadMonth(month, year);
		}
		//nextMonth
		else if(action.equals("nextMonth")){
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

		monthPresentation.setName(HelperUtilities.getMonthName(monthCal.get(Calendar.MONTH)));
		monthPresentation.setYear(monthCal.get(Calendar.YEAR));
		monthPresentation.setFirstDay(HelperUtilities.getDayOfWeek(monthCal));
		monthPresentation.setNumOfDays(HelperUtilities.getNumOfDays(monthCal));
		
		try {
			monthPresentation.setAppointments(calendarDelegate.findAppt(monthCal.get(Calendar.MONTH), monthCal.get(Calendar.YEAR)));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(monthPresentation);
		
		return monthPresentation;
	}
}
