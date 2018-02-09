package kikakuya.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kikakuya.delegate.EventDelegate;
import kikakuya.model.Event;

@Controller
//@RequestMapping(value="/viewEvent")
public class EventController {

	@Autowired
	EventDelegate eventDelegate;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String viewAddEvent(Model model, HttpServletRequest request) throws SQLException{
		
		model.addAttribute("event", new Event());
		List <Event> list = eventDelegate.listAllEvents();
		//model.addAttribute("listEvent", list);
		request.setAttribute("listEvent", list);
		return "event_add";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String list(Model model, HttpServletRequest request) throws SQLException{
		
		//Model model = new Model("event_add");
		
		List <Event> list = eventDelegate.listAllEvents();
		//model.addAttribute("listEvent", list);
		request.setAttribute("listEvent", list);
		return "event_add";
	}
	
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//    public String displayItems(Map<String, Object> map) throws SQLException {
//        //model.addAttribute("event", event);
//		map.put("eventList", eventDelegate.listAllEvents());
//		return "list";
//    }
	
	
/*@RequestMapping(value="/list", method = RequestMethod.GET)
	public String displayEvents(Map<String, Object> events) throws SQLException{
		
		events.put("events", eventDelegate.listAllEvents());
		
		return "event_add";
		
	}*/
	
	//working
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("event") Event event,/* BindingResult bindingResult, */Model model, HttpServletRequest request){
		//String redirectTo = "event_add";
		//ModelAndView model = new ModelAndView("event_add");
		
		//Event event = new Event();
		//model.addAttribute("event", event);
		
		try {
			List <Event> list = eventDelegate.listAllEvents();
			if(list.size() <3 ){
			boolean isValidEvent = eventDelegate.insertEvent(event);
			if(isValidEvent){
				System.out.println("Insert successful");
				
				model.addAttribute("eventName", event.getEventName());
				//model.addAttribute("eventDate", event.getUserUserId());
				model.addAttribute("location", event.getLocation());
				
				
				//redirectTo = "event_add";
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
		return "event_add";
	}
	
	
	@RequestMapping(value="/update/{eventId}", method=RequestMethod.GET)
	public String update(@PathVariable("eventId") @ModelAttribute("event") Event event)throws SQLException{
		
//		ModelAndView model = new ModelAndView("views/event_add");
//		
//		Event event = eventDelegate.findEventById(eventId);
//		model.addObject("eventAdd", event);
		
		try {
			boolean isUpdateEvent = eventDelegate.updateEvent(event);
			if(isUpdateEvent){
				System.out.println("Delete successful");
			
				
				//redirectTo = "event_add";
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
	
	@RequestMapping(value="/delete/{eventId}", method=RequestMethod.GET)
	public String delete(@PathVariable("eventId")int eventId) throws SQLException{
		
		//eventDelegate.deleteEvente(eventId);
		
		//return new ModelAndView("redirect:/list");
		try {
			boolean isDeleteEvent = eventDelegate.deleteEvent(eventId);
			if(isDeleteEvent){
				System.out.println("Delete successful");
			
				
				//redirectTo = "event_add";
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
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("eventAdd")Event event) throws SQLException{
		
		//come back here!!!!!!!!!!!!!!!!!
		if (event != null ){ 
			// update
			eventDelegate.updateEvent(event);
		}
		//*else if (event.getEventId) != null){
			// update
			//eventService.updateEvent(event);}
		
		else{
			// add new
			eventDelegate.insertEvent(event);
		}
		
		return new ModelAndView("redirect:/list");
	}
	
}
