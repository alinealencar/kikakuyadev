package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kikakuya.delegate.EventDelegate;
import kikakuya.model.Event;
import kikakuya.model.Guest;
import kikakuya.model.User;

@Controller
public class EventController {

	@Autowired
	EventDelegate eventDelegate;
	
	//List all the event by user
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String viewAddEvent(Model model, HttpServletRequest request) throws SQLException{
		
		User user = (User) request.getSession().getAttribute("user");
		try {
			List<Event> event = eventDelegate.listEventsByUser(user);
			if (event.size() > 0){
				request.setAttribute("listEvent", event);
			}
			else{
				request.setAttribute("noEvents", "No events created yet! Create one!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("event", new Event());
		return "event";
	}
	
	//Add event
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("event") Event event, Model model, 
					HttpServletRequest request){ 
		
		User user = (User) request.getSession().getAttribute("user");
		try {
			List <Event> list = eventDelegate.listEventsByUser(user);
	
			if(list.size() <3 ){
			boolean isValidEvent = eventDelegate.insertEvent(event, user);
			if(isValidEvent){
				System.out.println("Insert successful");
			}
			else {
					System.out.println("Insert unsuccessful");
			}
			
			}
			else
				request.setAttribute("insertError", "Errorrrrrrrrrrr!");
		}
		catch(Exception e) {
				e.printStackTrace();
			}
		
		return "redirect:/list";
	}
	
	//work on this one
	@RequestMapping(value="/update/{eventId}", method=RequestMethod.GET)
//	public String update(@PathVariable("eventId") @ModelAttribute("event") Event event)throws SQLException{
	public String update(@PathVariable("eventId") int eventId, @ModelAttribute("event") Event event, HttpServletRequest session,
			HttpServletRequest request, Model model)throws SQLException{
		
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("event", new Event());
		try {
			boolean isUpdateEvent = eventDelegate.updateEvent(event);
			if(isUpdateEvent){
				List <Event> list = eventDelegate.listEventsByUser(user);
				session.setAttribute("listEvent", list);
//				session.setAttribute("eventName", event.getEventName());
//				session.setAttribute("eventDate", event.getEventDate());
//				session.setAttribute("location", event.getLocation());
				System.out.println("Update successful");
		}
				else {
				System.out.println("Update unsuccessful");
			}
		}
		catch(Exception e) {
				e.printStackTrace();
			}
		
		return "event";
	}
	
	//Delete event
	@RequestMapping(value="/delete/{eventId}", method=RequestMethod.GET)
	public String delete(@PathVariable("eventId")int eventId) throws SQLException{
		try {
			boolean isDeleteEvent = eventDelegate.deleteEvent(eventId);
			if(isDeleteEvent){
				System.out.println("Delete successful");
			} 
			else {
					System.out.println("Delete unsuccessful");
			}
		}
		catch(Exception e) {
				e.printStackTrace();
			}
		return "redirect:/list";
	}
}
