package kikakuya.delegate;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;

import kikakuya.model.Vendor;
import kikakuya.service.SearchService;

public class SearchDelegate {

	private SearchService searchService;

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public JSONArray searchForVendors(String term, String location) throws JSONException, IOException {
		return searchService.searchForVendors(term, location);
	}

	public ArrayList<Vendor> createVendorObjects(JSONArray vendors) throws JSONException {
		return searchService.createVendorObjects(vendors);
	}



	
	
	
}

