package kikakuya.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

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
import kikakuya.model.Event;
import kikakuya.model.MonthPresentation;
import kikakuya.model.User;
import kikakuya.utilities.HelperUtilities;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarDelegate calendarDelegate;
	
	@RequestMapping(value="/calendar", method = RequestMethod.GET)
	public String viewAddEvent(Model model, HttpServletRequest request){
		model.addAttribute("appt", new Appointment());
		return "calendar";
	}
	
	@RequestMapping(value="/addAppt", method = RequestMethod.POST)
	@ResponseBody
	public String addAppt(HttpSession session, @ModelAttribute("appt") Appointment appt){
		boolean apptAdded;
		String message ="";
		try {
			//User user = (User) session.getAttribute("user");
			Event event = (Event) session.getAttribute("event");
			appt.setEventId(event.getEventId());
			
			apptAdded = calendarDelegate.addAppt(appt);
			
			if(apptAdded)
				message = "Appointment was added!";
			else
				message = "Error! The appointment was not added!";
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
			message = "Error! The appointment was not added!";
		}

		return message;
	}
	
	@RequestMapping(value = "/calendarNav", method = RequestMethod.POST)
	@ResponseBody
	public MonthPresentation Submit(HttpSession session, @RequestParam("month") String month, @RequestParam("year") String year, @RequestParam("action") String action) {	
		//Get user Id from the session
		User user = (User) session.getAttribute("user");
		
		Event event = (Event) session.getAttribute("event");
		
		MonthPresentation monthPresentation = new MonthPresentation();
		Calendar monthCal = null;
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
			monthPresentation.setAppointments(calendarDelegate.findAppts(monthCal.get(Calendar.MONTH), monthCal.get(Calendar.YEAR) , event.getEventId()));
			monthPresentation.setEvents(calendarDelegate.findEventsByMonth(monthCal, user.getUserId()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return monthPresentation;
	}
	
	@RequestMapping(value = "/showAppt", method = RequestMethod.POST)
	@ResponseBody
	public Appointment showAppt(@RequestParam("apptId") int apptId){
		Appointment appt = new Appointment();

		try {
			//Get appointment by Id received with the AJAX request
			appt = calendarDelegate.findAppt(apptId);
			System.out.println(appt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return appt;
	}
	
	@RequestMapping(value="/editAppt", method = RequestMethod.POST)
	@ResponseBody
	public String editAppt(@ModelAttribute("appt") Appointment appt){
		boolean apptEdited;
		String message ="";
		try {
			apptEdited = calendarDelegate.editAppt(appt);
		
			if(apptEdited)
				message = "Appointment was updated!";
			else
				message = "Error! The appointment was not updated!";
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
			message = "Error! The appointment was not updated!";
		}

		return message;
	}
	
	@RequestMapping(value="/deleteAppt", method = RequestMethod.POST)
	@ResponseBody
	public String deleteAppt(@RequestParam("apptId") int apptId){
		boolean apptDeleted;
		String message ="";
		try {
			apptDeleted = calendarDelegate.deleteAppt(apptId);
		
			if(apptDeleted)
				message = "Appointment was deleted!";
			else
				message = "Error! The appointment was not deleted!";
		} catch (SQLException e) {
			e.printStackTrace();
			message = "Error! The appointment was not deleted!";
		}

		return message;
	}
	
	@RequestMapping(value="/todaysAppts", method = RequestMethod.POST)
	@ResponseBody
	public List<Appointment> showTodaysAppts(){
		List<Appointment> apptList = null;
		try {
			Calendar date = Calendar.getInstance();
			apptList = calendarDelegate.findApptsByDay(date);
			System.out.println("TODAYS APPTS: " + apptList.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return apptList;
	}
}
