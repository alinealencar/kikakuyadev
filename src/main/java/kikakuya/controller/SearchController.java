package kikakuya.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kikakuya.delegate.SearchDelegate;
import kikakuya.model.Vendor;
import kikakuya.utilities.HelperUtilities;

@Controller
@RequestMapping(value="/search")
public class SearchController {
	
	@Autowired
	private SearchDelegate searchDelegate;

	/**
	 * When the page is loaded, this method is run.
	 * Create the kikakuya.model object (Vendor) and put it into the kikakuya.model map with the key "vendor".
	 * @param kikakuya.model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String viewSearch(Model model){
		model.addAttribute("vendor", new Vendor());
		return "search";
	}
	
	/**
	 * This method handles the form submission.
	 * The @ModelAttribute annotation makes the kikakuya.model object stored under the key "vendor"
	 * in the kikakuya.model map available to this method's body.
	 * @see viewSearch
	 * @param vendor
	 * @param kikakuya.model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("vendor") Vendor vendor, BindingResult bindingResult, Model model){
		
		//get values from form
		String category = request.getParameter("category");
		String location = request.getParameter("location");
		//String formattedLoc=  location.substring(0, 1).toUpperCase() + location.substring(1);
		String capitalizedLoc = HelperUtilities.capitalize(location);
		ArrayList<Vendor> vendors = new ArrayList<Vendor>();
		
		String redirectTo = "searchResult";
		
		try {
			//populate vendors list
			vendors = searchDelegate.createVendorObjects(searchDelegate.searchForVendors(category, location));
			
			request.setAttribute("vendors", vendors);
			request.setAttribute("category", category);
			request.setAttribute("location", capitalizedLoc);
			
			redirectTo = "searchResult";	
		} catch (JSONException e) {
			request.setAttribute("searchError", "No results found.");
			//e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("searchError", "No results found.");
			//e.printStackTrace();
		}	

		return redirectTo;

	}
}

