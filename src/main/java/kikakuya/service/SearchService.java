package kikakuya.service;

import java.io.IOException;
import java.util.ArrayList;

import org.json.*;

import kikakuya.model.Vendor;


public interface SearchService {

	public JSONArray searchForVendors(String term, String location) throws JSONException, IOException;
	public ArrayList<Vendor> createVendorObjects(JSONArray vendors) throws JSONException;
	
}
