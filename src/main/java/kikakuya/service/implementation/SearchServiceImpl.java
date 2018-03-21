package kikakuya.service.implementation;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import kikakuya.model.Vendor;
import kikakuya.service.SearchService;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.Request.Builder;

public class SearchServiceImpl implements SearchService{
	
	public JSONArray searchForVendors(String term, String location) throws JSONException, IOException{
		final String API_KEY = "GHXTrEYIoQ5WnF2Unl9YSXs44os7QS0PquAkU1eL2gz_jHsATJGp6X98U257JsN8zLdD2dufzwP1Ls90n8KeFK9FG84F6OfCsTAYw9R6npybodmWilCXZzKesnFwWnYx";
		OkHttpClient client = new OkHttpClient();
		
		//send request to Yelp API
		Request request = new Builder()
                .url("https://api.yelp.com/v3/businesses/search?term=" + term + "&location=" + location + "&limit=50")
                .get()
                .addHeader("authorization", "Bearer"+" "+API_KEY)
                .build();
		
		Response response = client.newCall(request).execute();
		
		//store response from Yelp to a JSONArray
		JSONObject jsonObject = new JSONObject(response.body().string().trim());       
		JSONArray vendors = (JSONArray)jsonObject.get("businesses");

		return vendors;
	}
	
	public ArrayList<Vendor> createVendorObjects(JSONArray vendors) throws JSONException {
		String name, category = "", address, website, phoneNo, imageURL;
		double rating;
		ArrayList<Vendor> vendorList = new ArrayList<Vendor>();
		
		//extract information from response 
		for(int i=0; i<vendors.length(); i++){
			name = vendors.getJSONObject(i).getString("name");
			address = vendors.getJSONObject(i).getJSONObject("location").getString("address1") + " "
					+ vendors.getJSONObject(i).getJSONObject("location").getString("city") + " " 
					+ vendors.getJSONObject(i).getJSONObject("location").getString("state") + " "
					+ vendors.getJSONObject(i).getJSONObject("location").getString("zip_code");
			website  = vendors.getJSONObject(i).getString("url");
			phoneNo  = vendors.getJSONObject(i).getString("phone");
			imageURL  = vendors.getJSONObject(i).getString("image_url");
			rating  = vendors.getJSONObject(i).getDouble("rating");
			
			//extract the category alias from the categories JSONArray
			JSONArray categoryArr = vendors.getJSONObject(i).getJSONArray("categories");
			for (int j=0; j<categoryArr.length(); j++){
				JSONObject categoryObject = categoryArr.getJSONObject(j);
				category = categoryObject.getString("alias");
			}
			
			//String formattedPhoneNo = String.format("(%s) %s - %s", phoneNo.substring(2, 5), phoneNo.substring(5, 8), phoneNo.substring(8, 11));
			
			//create Vendor object
			Vendor aVendor = new Vendor(name, address, website, phoneNo, imageURL, category, rating);
			vendorList.add(aVendor);
		}
		
		return vendorList;
	} 
}
