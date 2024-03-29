package kikakuya.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kikakuya.delegate.EventDelegate;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.User;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@Controller
public class EventController {

	@Autowired
	EventDelegate eventDelegate;
	
	//List all the events by user
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String viewEvent(HttpServletResponse response, HttpServletRequest request, Model model)/*, HttpServletRequest session*/ throws SQLException{
		String redirectTo = "event";
		
		User user = (User) request.getSession(false).getAttribute("user");
		try {
			if(user != null) {
				List<Event> event = eventDelegate.listEventsByUser(user);

				if (event.size() <= 0){
					request.setAttribute("noEvents", "No events created yet! Create one!");
					request.setAttribute("listEvent", new ArrayList<Event>());
				}
				else{
					request.setAttribute("listEvent", event);
				}
			}
			else {
				//if user not found in session, redirect them to the login page
				model.addAttribute("user", new User());
				redirectTo = "redirect:/logout";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("event", new Event());
		return redirectTo;
	}
	
	//Add an event
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("event") Event event, Model model, HttpServletRequest request, RedirectAttributes redirectAtt){ 
		
		User user = (User) request.getSession().getAttribute("user");
		
		try {
			List <Event> list = eventDelegate.listEventsByUser(user);
			if(list.size() < 3 ){
					boolean isValidEvent = eventDelegate.insertEvent(event, user);
					if(isValidEvent){
						System.out.println("Insert successful");
						redirectAtt.addFlashAttribute("insertSuccess", "Added successfully!");
						
						//Update event list
						request.getSession().setAttribute("listEvent", list);
					}
					else {
					System.out.println("Insert unsuccessful");
				}
			}
			else {
				redirectAtt.addFlashAttribute("insertError", "You are only allowed to create up to 3 events!");
			}
		}
		catch(Exception e) {
				e.printStackTrace();
			}
		
		return "redirect:/list";
	}
	
	//Update an event
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateEvent(@ModelAttribute("event") Event event, Model model,
			HttpServletRequest request, RedirectAttributes redirectAtt) throws SQLException{
				
		try{
			System.out.println(event);
			boolean isUpdateEvent = eventDelegate.updateEvent(event);
			if(isUpdateEvent){
				System.out.println("Update successful");
				redirectAtt.addFlashAttribute("updateSuccess", "Updated successfully!");
			}
			else{
				System.out.println("Update not successful");
				redirectAtt.addFlashAttribute("updateError", "Updated unsuccessful!");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/list";
	}
	
	//
	@RequestMapping(value="/edit", method = RequestMethod.POST)
	public String editEvent(@ModelAttribute("event") Event event, Model model,
			HttpServletRequest request) throws SQLException{
		
		Event selectedEvent = new Event();
		try{
			selectedEvent = eventDelegate.getSelectedEvent(event.getEventId());
		}
		catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("event", selectedEvent);
		//viewEvent(request, model);
		return "redirect:/list";
	}
	
	//Delete an event
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteEvent(@ModelAttribute Event event, Model model,HttpServletRequest request, RedirectAttributes redirectAtt) throws SQLException{
		
		try{
			boolean isDeleteEvent = eventDelegate.deleteEvent(event);
			if(isDeleteEvent){
				System.out.println("Delete successful");
				redirectAtt.addFlashAttribute("deleteEventSuccess", "Successfully deleted!");
			} 
			else {
				System.out.println("Delete unsuccessful");
				redirectAtt.addFlashAttribute("deleteEventError", "Unuccessfully deleted!");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/list";
	}
	
	//Select event by its ID
		@RequestMapping(value="/showEvent", method=RequestMethod.GET)
		public String selectByEventId(@ModelAttribute Event event, HttpServletRequest request) throws SQLException{
			
			HttpSession session = request.getSession();
			try{			
				Event eventName = eventDelegate.getSelectedEvent(event.getEventId());
				//System.out.println(event.getEventId());
				
//				System.out.println(eventName);

				//Calculate remaining days
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
				LocalDate eventsDate = LocalDate.parse(eventName.getEventDate(), formatter);
				LocalDate today = LocalDate.now();
				
				long daysBetween = ChronoUnit.DAYS.between(today, eventsDate);
				
				String headerMessage = "";
				if(daysBetween > 1)
					headerMessage = eventName.getEventName() + " in " + daysBetween + " days";
				else if(daysBetween == 1)
					headerMessage = eventName.getEventName() + " in " + daysBetween + " day";
				else
					headerMessage = eventName.getEventName() + " has already passed. Hope you had a great time!";
				
				session.setAttribute("headerMessage", headerMessage);
				//Send the event to the session scope
				session.setAttribute("event", eventName);
				
			}
			catch (Exception e){
				e.printStackTrace();
			}
			return "redirect:/calendar";
		}
}
